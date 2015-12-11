var goodsArray = new Array();

$(document).ready(function(){
   
    $('#cartContainer').draggable({
        containment:'document'
    });
    
    $('#fixedCart').droppable({
        accept: ".food",
        tolerance: "touch",
        drop:function(event, ui){
            var uiNum;
            uiNum = $(ui.draggable).attr("id");
            uiText = $(ui.draggable).text();
            i = uiText.indexOf("Look");
            uiText = uiText.substring(0,i);
            $(this).append("<div id="+uiNum+">"+uiText+"</div>");
            goodsArray.push(uiNum);
        }
    });
    
    $('.food').draggable({
        containment:'document',
        revert:true
    });
});