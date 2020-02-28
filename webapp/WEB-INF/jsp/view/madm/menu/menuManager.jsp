<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.ezwel.core.support.util.StringUtils"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>메뉴 관리</title>

<link href="${url:resource('/resources/js/plugin/jquery.dynatree-1.2.6-all/src/skin/ui.dynatree.css')}" rel="stylesheet" type="text/css">
<script src="${url:resource('/resources/js/plugin/jquery.dynatree-1.2.6-all/jquery/jquery-ui.custom.js')}" ></script>
<script src="${url:resource('/resources/js/plugin/jquery.dynatree-1.2.6-all/jquery/jquery.cookie.js')}" ></script>
<script src="${url:resource('/resources/js/plugin/jquery.dynatree-1.2.6-all/src/jquery.dynatree.js')}" ></script>

<script type="text/javascript">

	jQuery.ajax({
		<c:if test='${not empty menuGroup}'>
			url: '/madm/menu/tree/init?menuGroup=${menuGroup}',
			dataType: 'json'
		</c:if>
	}).done(function(data){
		levelCodeCnt = data.menuMaxCd; // 추가시 메뉴코드 생성
		$("#tree").dynatree({
			onActivate: function(node) {
				$(".menuSeq").val(node.data.menuSeq);
				$(".menuNm").val(node.data.title);
				$(".menuCd").val(node.data.menuCd);
				$(".menuUrl").val(node.data.menuUrl);

				$(".authCd").val(node.data.authCd);
				$(".dispYn").val(emptyValue(node.data.dispYn));
				$(".useYn").val(emptyValue(node.data.useYn));
				$(".expandYn").val(emptyValue(node.data.expandYn));

				$(".imgUrl").val(node.data.imgUrl);
				$(".imgUrl2").val(node.data.imgUrl2);
				$(".menuTxt").val(node.data.menuTxt);
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
	var levelCodeCnt = 0;

	/** 노드의 레벨별로 정렬순서를 저장하기 위한 변수 */
	var nodeStep = 0;


	function menuCompletion() {
		var rootNode = $("#tree").dynatree("getRoot");
		recursiveNode(rootNode);
		for (var i = 0; i < nodeArray.length; i++) {
			j$("#menuForm").prepend("<input type='hidden' name='menuData' value='" + nodeArray[i] + "' />");
		}

		j$("#menuForm").submit();
		return false;
	}

	function recursiveNode(node) {
		if (node.countChildren() > 0) {
			for (var i = 0; i < node.childList.length; i++) {
				nodeStep++;
				recursiveNode(node.childList[i]);
			}
			if (node.data.title != null) nodeArray.push(node.data.levelCd + "##" + getParentCode(node) +
					"##" + node.data.title + "##" + getOrderBy(node) + "##" + node.data.menuCd + "##" + node.data.imgUrl + "##" + node.data.imgUrl2 +
					"##" + node.data.menuTxt + "##" + node.data.expandYn + "##" + node.data.authCd + "##" + node.data.dispYn + "##" + node.data.useYn +
					"##" + nodeStep + "##" + node.data.menuSeq);
		} else {
			if (node.data.title != null) nodeArray.push(node.data.levelCd + "##" + getParentCode(node) +
					"##" + node.data.title + "##" + getOrderBy(node) + "##" + node.data.menuCd + "##" + node.data.imgUrl + "##" + node.data.imgUrl2 +
					"##" + node.data.menuTxt + "##" +node.data.expandYn + "##" + node.data.authCd + "##" + node.data.dispYn + "##" + node.data.useYn +
					"##" + nodeStep + "##" + node.data.menuSeq);
		}
		nodeStep--;
		return;
	}

	function getParentCode(node) {
		if (node.getParent().data.title == null) return 0;
		else
			return node.getParent().data.levelCd;

	}

	function getOrderBy(node) {
		if (node.getPrevSibling() == null) {
			return node.data.order = 1;
		} else {
			node.data.order = node.getPrevSibling().data.order + 1;
			return node.data.order;
		}
	}

	function addMenu() {
		$.divPop("callbackMenuCd", "메뉴코드", "/madm/menu/getMenuCd/layerPopup");
		return  false;
	}

	/**
	 * 콜백함수 addMenu(); 에서 divPop을 호출시 팝업선택 완료후 popupmenuCd()를 호출함.
	 */
	function callbackMenuCd(menuCd, menuNm, menuUrl) {
		var rootNode = $("#tree").dynatree("getRoot");
		var childNode = rootNode.addChild({
			title: menuNm,
			levelCd: (levelCodeCnt++),
			menuCd: menuCd,
			menuUrl: menuUrl,
			imgUrl : "",
			imgUrl2 : "",
			menuTxt : "",
			expandYn : "Y",
			dispYn : "Y",
			useYn : "Y",
			authCd : "",
			order: -1
		});
		menuCompletion();
	}

	function nodeModefy() {
		var node = $("#tree").dynatree("getActiveNode");
		node.data.title = $(".menuNm").val();
		node.data.dispYn = $(".dispYn").val();
		node.data.useYn = $(".useYn").val();
		node.data.expandYn = $(".expandYn").val();
		node.data.imgUrl = $(".imgUrl").val();
		node.data.imgUrl2 = $(".imgUrl2").val();
		node.data.menuTxt = $(".menuTxt").val();
		node.data.authCd = $(".authCd").val();

		node.render();
		alert("수정되었습니다. \n 최종 저장하려면 트리를 저장해야 됩니다.")
	}

	function nodeRemove() {
		var node = $("#tree").dynatree("getActiveNode");
		if (node.childList != null) {
			j$.alert("하위메뉴가 있어서 삭제할 수 없습니다.");
			return;
		}
		node.remove();

		/* 마지막 삭제시 트리라인이 깨지는 현상 해결*/
		var rootNode = $("#tree").dynatree("getRoot");
		rootNode.render();
		alert("삭제되었습니다. \n 최종 저장하려면 트리를 저장해야 됩니다.")
	}



	j$(document).ready(function() {
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

	function nodeDetail() {
		var node = $("#tree").dynatree("getActiveNode");
		var menuSeq = node.data.menuSeq;
		var menuGroup = '${menuGroup}';
		$.divPop("clientList", "고객사 리스트", "/madm/menu/getClientList/layerPopup?menuSeq=" + menuSeq + "&menuGroup=" + menuGroup);
	}

	function menuGroupChange(v) {
		location.href = "/madm/menu/tree?menuGroup=" + v
	}

	function makeGroup() {
		if ($("#groupNm").val() == "") {
			alert("그룹명을 입력해주세요.");
			return;
		}
		location.href = "/madm/menu/createGroup?menuGroup=" + $("#groupNm").val();
	}

	function doCopy() {

		if (confirm("복사를 실행할 경우 복사할 고객사의 모든데이터는 삭제되고 대상 고객사로 변경됩니다.\n 복사를 하시겠습니까?")) {
			var from = $("[name=fromClientCd]").val();
			var to = $("[name=toClientCd]").val();

			if (from == "" || to == "") {
				alert("고객사를 선택해주세요.");
				return;
			}
			if (from == to) {
				alert("동일한 고객사는 복사가 불가능합니다.");
				return;
			}

			var params = {};
			params.menuGroup = '${menuGroup}';
			params.fromClientCd = from;
			params.toClientCd = to;
			j$.ajax({
				url: '/madm/menu/doCopyClient',
				data: params,
				dataType: 'json',
				success: function(data, textStatus){
					alert("복사가 완료되었습니다.");
				}
			});
		}
		return false;
	}
</script>


</head>
	<body class="example">
		<form id="menuForm" name="menuForm" action="/madm/menu/add" method="post">
			<input name="menuGroup" value="${menuGroup}" type="hidden" />

<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
			<!-- 버튼 영역 시작 -->
			<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
				<tr>
					<td align="left" class="subtitle">메뉴 관리</td>
					<td align="right">
					</td>
				</tr>
			</table>
			<!-- 버튼 영역 종료 -->

			<p class="description">
			 	<select onchange="menuGroupChange(this.value);">
			 		<option value="">선택해주세요.</option>
			 		<c:forEach var="list" items="${ menuGroupList }">
			 			<option value="${list.menuGroup }" <c:if test="${list.menuGroup eq menuGroup}">selected</c:if> >${list.menuGroup}</option>
			 		</c:forEach>
			 	</select>
			 	<input type="text" id="groupNm" />
			 	<input type="button" onclick="makeGroup();"  value="그룹생성"/>
			</p>


			<table width="100%" >
				<tr>
					<td rowspan="2">
						<input type="button" onclick="menuCompletion();"  value="저장하기"/>
						<input type="button" onclick="addMenu();"  value="메뉴코드 추가"/>
						<input type="button" id="btnExpand" value="접기/펼치기" />
						<div id="tree">

						</div>
					</td>
					<td valign="top">
						<strong>메뉴 상세 정보</strong>
						<table cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
							<tr>
								<td width="25%">메뉴번호</td>
								<td width="75%"><input type="text" class="menuSeq" value="" readonly/></td>
							</tr>
							<tr>
								<td>메뉴명</td>
								<td><input type="text" class="menuNm" value="" size="45" /></td>
							</tr>
							<tr>
								<td>메뉴코드</td>
								<td><input type="text" class="menuCd" value="" readonly/></td>
							</tr>
							<tr>
								<td>URL</td>
								<td><input type="text" class="menuUrl" value="" size="45" readonly /></td>
							</tr>
							<tr>
								<td>권한</td>
								<!-- <td><input type="text" class="authCd" value="" /></td> -->
								<td>
									<select name="authCd" class="authCd">
											<option value="">선택</option>
										<c:forEach var="authList" items="${authList}">
											<option value="${authList.authCd}" >${authList.authNm}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td>노출여부</td>
								<td>
									<select class="dispYn"  >
										<option value="Y">Y</option>
										<option value="N">N</option>
									</select>
								</td>
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
							<tr>
								<td>확장여부</td>
								<td>
									<select class="expandYn" >
										<option value="Y">Y</option>
										<option value="N">N</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>IMG URL</td>
								<td>
									<input type="text" class="imgUrl" value="" size="45" />
								</td>
							</tr>
							<tr>
								<td>IMG URL2</td>
								<td>
									<input type="text" class="imgUrl2" value="" size="45" />
								</td>
							</tr>
							<tr>
								<td>카피 문구</td>
								<td>
									<input type="text" class="menuTxt" value="" size="45" />
								</td>
							</tr>
						</table>
						<input type="button" onclick="nodeModefy();"  value="수정" style="margin-top:15px; margin-left:80px"/>
<!-- 						<input type="button" onclick="nodeRemove();"  value="delete"/> -->
						<input type="button" onclick="nodeDetail();"  value="고객사정보"/>

					</td>
				</tr>
				<tr>
					<td valign="top">
						<strong>고객사 복사</strong> <br />
						<select name="fromClientCd">
							<option value="">복사대상 고객사</option>
							<c:forEach var="list" items="${ clientList }">
				 				<option value="${list.clientCd }">${list.clientNm}(${list.clientCd})</option>
				 			</c:forEach>
			 			</select>
			 			→
						<select name="toClientCd">
							<option value="">복사할 고객사</option>
							<c:forEach var="list" items="${ clientList }">
				 				<option value="${list.clientCd }">${list.clientNm}(${list.clientCd})</option>
				 			</c:forEach>
			 			</select>
			 			<input type="button" onclick="doCopy();"  value="복사하기"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
		</form>
	</body>
</html>