/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {

	config.toolbar = [
		              	['Source','-','Save','NewPage','Preview','-','Templates'],
		              	['Cut','Copy','Paste','PasteText','PasteFromWord','Print'],
		              	['Undo','Redo','-','Find','Replace'],
		              	['Link','Unlink','Image','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
		              	'/',
		              	['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
		              	['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],

		              	//['Form', 'Checkbox', 'Radio','TextField', 'Textarea', 'Select', 'Button'],
		              	['Button'],
		              	['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
		              	'/',
		              	['Styles','Format','Font','FontSize','TextColor','BGColor'],['Maximize']
	              	];

	// %REMOVE_START%
	// The configuration options below are needed when running CKEditor from source files.
	config.plugins = 'dialogui,dialog,about,a11yhelp,dialogadvtab,basicstyles,bidi,blockquote,clipboard,button,panelbutton,panel,floatpanel,colorbutton,colordialog,templates,menu,contextmenu,div,resize,toolbar,elementspath,enterkey,entities,popup,filebrowser,find,fakeobjects,floatingspace,listblock,richcombo,font,forms,format,horizontalrule,htmlwriter,iframe,wysiwygarea,image,indent,indentblock,indentlist,smiley,justify,menubutton,language,link,list,liststyle,magicline,maximize,newpage,pagebreak,pastetext,pastefromword,preview,print,removeformat,save,selectall,showblocks,showborders,sourcearea,specialchar,scayt,stylescombo,tab,table,tabletools,undo,wsc';
	config.skin = 'moono';
	// %REMOVE_END%

	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	//config.AllowedContent = "br[clear]";
	config.enterMode = CKEDITOR.ENTER_BR;
	config.shiftEnterMode = CKEDITOR.ENTER_BR;
	config.fillEmptyBlocks = false;

	config.docType = '<!DOCTYPE html>';
	//config.docType = '<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">';
	config.font_names = '나눔고딕/NanumGothic;굴림/Gulim;돋움/Dotum;바탕/Batang;궁서/Gungsuh;Arial/Arial;Comic Sans MS/Comic Sans MS;Courier New/Courier New;Georgia/Georgia;Lucida Sans Unicode/Lucida Sans Unicode;Tahoma/Tahoma;Times New Roman/Times New Roman;Trebuchet MS/Trebuchet MS;Verdana/Verdana';
	config.fontSize_defaultLabel = '10px';
	config.width ='100%';
	config.height ='500';

	config.tabIndex = 0;	// 에디트 안에서 탭 사용하기
	config.tabSpaces = 4;	// 탭 칸수

};


j$(document).ready(function(){

	   CKEDITOR.on('instanceReady', function(evt) {
	   	var editor = evt.editor;
	   	editor.dataProcessor.writer.selfClosingEnd = '>';
	   	editor.toolbox.focusCommandExecuted = true;
	   	editor.config.toolbarGroupCycling = true;
	   	editor.config.toolbar = 'Basic';

	   	var tollbarButtons = j$('.'+ editor.id).find('.cke_toolbox a');
	   	for (var i = 0; i < tollbarButtons.length; i++) {
	   	    var tollbarButton = tollbarButtons[i];
	   	    if (CKEDITOR.env.gecko) {
	   		    j$(tollbarButton).attr('tabindex', 0);
	   		} else {
	   		    tollbarButton.removeAttribute("tabindex");
	   		}
	   	    tollbarButton.removeAttribute("hidefocus");
	   	}
	   	var toolbars = editor.toolbox.toolbars;
	   	var toolbarFirstGroup = toolbars[0];
	   	var toolbarLastGroup = toolbars[editor.toolbox.toolbars.length-1];
	   	var firstButtonId = toolbarFirstGroup.items[0].id;
	   	var firstButton = j$("#"+ firstButtonId);
	   	if (!j$(firstButton).hasClass("cke_button")) {
	   	    firstButton = j$(firstButton).find("a:first");
	   	}
	   	j$(firstButton).on("keydown", function(evt) {
	   	    if (evt.shiftKey && evt.keyCode == 9) { // SHIFT+TAB

	   	        var j$formElements = j$("input, select, textarea"),
	   	            previousFormElementIndex = j$formElements.index(j$("#"+ editor.name)) - 1;
	   	        var previousFormElement = j$formElements.eq(previousFormElementIndex);
	   	        j$(previousFormElement).focus();
	   	    }
	   	});
	   	var lastButtonId = toolbarLastGroup.items[toolbarLastGroup.items.length-1].id;
	   	var lastButton = j$("#"+ lastButtonId);
	   	if (!j$(lastButton).hasClass("cke_button")) {
	   	    lastButton = j$(lastButton).find("a:last");
	   	}
	   	j$(lastButton).on("keydown", function(evt) {
	   	    if (!evt.shiftKey && evt.keyCode == 9) { // TAB
	   	        editor.focus();
	   	    }
	   	});
	   });
});


