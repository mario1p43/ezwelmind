<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.ezwel.core.support.util.StringUtils"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>부서관리</title>

<link href="${url:resource('/resources/js/plugin/jquery.dynatree-1.2.6-all/src/skin/ui.dynatree.css')}" rel="stylesheet" type="text/css">
<script src="${url:resource('/resources/js/plugin/jquery.dynatree-1.2.6-all/jquery/jquery-ui.custom.js')}" ></script>
<script src="${url:resource('/resources/js/plugin/jquery.dynatree-1.2.6-all/jquery/jquery.cookie.js')}" ></script>
<script src="${url:resource('/resources/js/plugin/jquery.dynatree-1.2.6-all/src/jquery.dynatree.js')}" ></script>

<script type="text/javascript">

	jQuery.ajax({
		<c:if test='${not empty clientCd}'>
			url: '/madm/clientDivision/divisionMain/init?clientCd=${clientCd}',
			dataType: 'json'
		</c:if>
	}).done(function(data){
		commCdCnt = data.divisionMaxCd; // 추가시 메뉴코드 생성
		$("#tree").dynatree({
			onActivate: function(node) {
				$(".commCd").val(node.data.commCd);
				$(".commNm").val(node.data.commNm);
				$(".useYn").val(emptyValue(node.data.useYn));
			},
			children : data.josonData,
			dnd: {
				onDragStart: function(node) {
					/** This function MUST be defined to enable dragging for the tree.
					 *  Return false to cancel dragging of node.
					 */
					logMsg("tree.onDragStart(%o)", node);
					return true;
				},
				onDragStop: function(node) {
					// This function is optional.
					logMsg("tree.onDragStop(%o)", node);
				},
				autoExpandMS: 1000,
				preventVoidMoves: true, // Prevent dropping nodes 'before self', etc.
				onDragEnter: function(node, sourceNode) {
					/** sourceNode may be null for non-dynatree droppables.
					 *  Return false to disallow dropping on node. In this case
					 *  onDragOver and onDragLeave are not called.
					 *  Return 'over', 'before, or 'after' to force a hitMode.
					 *  Return ['before', 'after'] to restrict available hitModes.
					 *  Any other return value will calc the hitMode from the cursor position.
					 */
					logMsg("tree.onDragEnter(%o, %o)", node, sourceNode);
					return true;
				},
				onDragOver: function(node, sourceNode, hitMode) {
					/** Return false to disallow dropping this node.
					 *
					 */
					logMsg("tree.onDragOver(%o, %o, %o)", node, sourceNode, hitMode);
					// Prevent dropping a parent below it's own child
					if(node.isDescendantOf(sourceNode)){
						return false;
					}
					// Prohibit creating childs in non-folders (only sorting allowed)
					if( !node.data.isFolder && hitMode === "over" ){
						return "after";
					}
				},
				onDrop: function(node, sourceNode, hitMode, ui, draggable) {

					/** This function MUST be defined to enable dropping of items on
					 * the tree.
					 */
					logMsg("tree.onDrop(%o, %o, %s)", node, sourceNode, hitMode);
					sourceNode.move(node, hitMode);
					// expand the drop target
					//sourceNode.expand(true);
				},
				onDragLeave: function(node, sourceNode) {
					/** Always called if onDragEnter was called.
					 */
					logMsg("tree.onDragLeave(%o, %o)", node, sourceNode);
				}
			}
		});

	});


	/** 최종 노드 정보를 저장 */
	var nodeArray = new Array();

	/** html에서 생성된 노드에 키값을 부여하기 위한 변수 */
	var commCdCnt = 0;



	function divisionCompletion() {
		var rootNode = $("#tree").dynatree("getRoot");
		recursiveNode(rootNode);
		for (var i = 0; i < nodeArray.length; i++) {
			$("#divisionForm").prepend("<input type='hidden' name='divisionData' value='" + nodeArray[i] + "' />");
		}

		$("#divisionForm").submit();
		return false;
	}

	function recursiveNode(node) {
		if (node.countChildren() > 0) {
			for (var i = 0; i < node.childList.length; i++) {
				recursiveNode(node.childList[i]);
			}
			if (node.data.title != null) 
				nodeArray.push(node.data.commCd + "##" + getParentCode(node) + "##" + node.data.commNm + "##" + getOrderBy(node) + "##" + node.data.useYn);
		} else {
			if (node.data.title != null) 
				nodeArray.push(node.data.commCd + "##" + getParentCode(node) + "##" + node.data.commNm + "##" + getOrderBy(node) + "##" + node.data.useYn);
		}
		return;
	}

	function getParentCode(node) {
		if (node.getParent().data.commNm == null) 
			return 100002; // client생성시 소속1 코드가 100002로 생성 됨.
		else
			return node.getParent().data.commCd;

	}

	function getOrderBy(node) {
		if (node.getPrevSibling() == null) {
			return node.data.order = 1;
		} else {
			node.data.order = node.getPrevSibling().data.order + 1;
			return node.data.order;
		}
	}


	/**
	 * 콜백함수 addMenu(); 에서 divPop을 호출시 팝업선택 완료후 popupmenuCd()를 호출함.
	 */
	function addDivision() {
		var rootNode = $("#tree").dynatree("getRoot");
		var childNode = rootNode.addChild({
			title: "새부서",
			commCd: (commCdCnt++),
			commNm: "새부서",
			useYn : "Y",
			order: -1
		});
		divisionCompletion();
	}

	function nodeModefy() {
		var node = $("#tree").dynatree("getActiveNode");
		node.data.title = $(".commNm").val();
		node.data.commNm = $(".commNm").val();
		node.data.useYn = $(".useYn").val();

		node.render();
		alert("수정되었습니다. \n 최종 저장하려면 트리를 저장해야 됩니다.")
	}

	function nodeRemove() {
		var node = $("#tree").dynatree("getActiveNode");
		if (node.childList != null) {
			$.alert("하위메뉴가 있어서 삭제할 수 없습니다.");
			return;
		}
		node.remove();

		/* 마지막 삭제시 트리라인이 깨지는 현상 해결*/
		var rootNode = $("#tree").dynatree("getRoot");
		rootNode.render();
		alert("삭제되었습니다. \n 최종 저장하려면 트리를 저장해야 됩니다.")
	}



	$(document).ready(function() {
		/**
		 * 노드 접기와 펼치기 기능
		**/
		$("#btnExpand").click(function(){
			var isNodeExpand = false;
			$("#tree").dynatree("getRoot").visit(function(node){
				if (node.isExpanded()) {
					isNodeExpand = true;
				}
			});
			$("#tree").dynatree("getRoot").visit(function(node){
				if (isNodeExpand) {
					node.expand(false);
				} else {
					node.expand(true);
				}
			});
		});


	});


	function emptyValue(v) {
		if (v == null) {
			return "Y";
		}
		else return v;
	}


	function clientCdChange(v) {
		location.href = "/madm/clientDivision/divisionMain?clientCd=" + v
	}


</script>


</head>
<body class="example">
	<form id="divisionForm" name="divisionForm" action="/madm/clientDivision/add" method="post">
		<input name="clientCd" value="${clientCd}" type="hidden" />

		<table cellpadding="0" cellspacing="0" border="0" width="95%">
			<tr>
				<td height="20px"></td>
			</tr>
			
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
						<tr>
							<td align="left" class="subtitle">부서 관리</td>
							<td align="right">
							</td>
						</tr>
					</table>
		
					<p class="description">
					 	<select onchange="clientCdChange(this.value);">
					 		<option value="">선택해주세요.</option>
					 		<c:forEach var="list" items="${ clientList }">
					 			<option value="${list.clientCd }" <c:if test="${list.clientCd eq clientCd}">selected</c:if>>${list.clientCd}</option>
					 		</c:forEach>
					 	</select>
					</p>
		
		
					<table width="100%" >
						<tr>
							<td rowspan="2">
								<input type="button" onclick="divisionCompletion();"  value="저장하기"/>
								<input type="button" onclick="addDivision();"  value="부서추가"/>
								<input type="button" id="btnExpand" value="접기/펼치기" />
								<div id="tree">
		
								</div>
							</td>
							<td valign="top">
								<strong>부서 상세 정보</strong>
								<table cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
									<tr>
										<td width="25%">부서코드</td>
										<td width="75%"><input type="text" class="commCd" value="" readonly/></td>
									</tr>
									<tr>
										<td>부서명</td>
										<td><input type="text" class="commNm" value="" size="45" /></td>
									</tr>
									<tr>
										<td>사용여부</td>
										<td>
											<select class="useYn" >
												<option value="Y">Y</option>
												<option value="N">N</option>
											</select>
										</td>
									</tr>
								</table>
								<input type="button" onclick="nodeModefy();"  value="수정" style="margin-top:15px; margin-left:80px"/>
		<!-- 						<input type="button" onclick="nodeRemove();"  value="delete"/> -->
		
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>