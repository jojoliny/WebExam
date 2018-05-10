<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/common_tag.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!-- saved from url=(0044)http://www.sucaihuo.com/jquery/10/1090/demo/ -->
<html><head lang="en"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>错题本</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap-3.3.4.css">
<link href="css/studentQuestion_index/index.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.9.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/Questions.js"></script>
<script>

var questions= ${realQuestionAndAnswer};
var itemList=["A","B","C","D"]
var activeQuestion=0; //当前操作的考题编号
var questioned = 0; //
var checkQues = []; //已做答的题的集合

//展示考卷信息
function showQuestion(id){
    $(".questioned").text(id+1);
    questioned = (id+1)/questions.length
    if(activeQuestion!=undefined){
        $("#ques"+activeQuestion).removeClass("question_id").addClass("active_question_id");
    }
    activeQuestion = id;
    $(".question").find(".question_info").remove();
    var question = questions[id];
    $(".question_title").html("<strong >第 "+(id+1)+" 题 、</strong>"+question.questions+"<input value="+(id+1)+" name=realIdEnd class=hidden>");
    
    var items=new Array(4);
    items[0]= question.questionA;
    items[1]=question.questionB;
    items[2]=question.questionC;
    items[3]=question.questionD;
    var item="";
    for(var i=0;i<4;i++){
        item ="<li class='question_info' onclick='clickTrim(this)' id='item"
                +i+"'><input type='radio' name='item' value='"+itemList[i]+"'>&nbsp;"+itemList[i]+"."+items[i]+"</li>";
        $(".question").append(item);
    }
    $(".question").attr("id","question"+id);
    $("#ques"+id).removeClass("active_question_id").addClass("question_id");
    for(var i=0;i<checkQues.length;i++){
        if(checkQues[i].id==id){
            $("#"+checkQues[i].item).find("input").prop("checked","checked");
            $("#"+checkQues[i].item).addClass("clickTrim");
            $("#ques"+activeQuestion).removeClass("question_id").addClass("clickQue");
        }
    }
}

/*答题卡*/
function answerCard(){
    $(".question_sum").text(questions.length);
    for(var i=0;i<questions.length;i++){
        var questionId ="<li id='ques"+i+"'onclick='saveQuestionState("+i+")' class='questionId'>"+(i+1)+"</li>";
        $("#answerCard ul").append(questionId);
    }
}

/*选中考题*/
var Question;
function clickTrim(source){
    var id = source.id;
    $("#"+id).find("input").prop("checked","checked");
    $("#"+id).addClass("clickTrim");
    $("#ques"+activeQuestion).removeClass("question_id").addClass("clickQue");
    var ques =0;
    for(var i=0;i<checkQues.length;i++){
       if( checkQues[i].id==activeQuestion&&checkQues[i].item!=id){
           ques = checkQues[i].id;
           checkQues[i].item = id;//获取当前考题的选项ID
           checkQues[i].answer =$("#"+id).find("input[name=item]:checked").val();//获取当前考题的选项值
       }
    }
    if(checkQues.length==0||Question!=activeQuestion&&activeQuestion!=ques){
        var check ={};
        check.id=activeQuestion;//获取当前考题的编号
        check.item = id;//获取当前考题的选项ID
        check.answer =$("#"+id).find("input[name=item]:checked").val();//获取当前考题的选项值
        checkQues.push(check);
    }
    $(".question_info").each(function(){
        var otherId =$(this).attr("id");
        if(otherId!=id){
            $("#"+otherId).find("input").prop("checked",false);
            $("#"+otherId).removeClass("clickTrim");
        }
    })
    Question = activeQuestion;
}



/*保存考题状态 已做答的状态*/
function saveQuestionState(clickId){
    showQuestion(clickId)
}

$(function(){
 
  
    answerCard();
    showQuestion(0);
    /*alert(QuestionJosn.length);*/
    /*实现进度条信息加载的动画*/
    var str = '';
   

    /*收藏按钮的切换*/
    $("#unHeart").click(function(){
        $(this).hide();
        $("#heart").show();
    })
    $("#heart").click(function(){
        $(this).hide();
        $("#unHeart").show();
    })

    /*答题卡的切换*/
    $("#openCard").click(function(){
        $("#closeCard").show();
        $("#answerCard").slideDown();
        $(this).hide();
    })
    $("#closeCard").click(function(){
        $("#openCard").show();
        $("#answerCard").slideUp();
        $(this).hide();
    })
//返回主界面
    $("#submitQuestions").click(function(){
       /* alert(JSON.stringify(checkQues));*/
        alert("已查看:"+($(".clickQue").length)+"道题,还有"+(questions.length-($(".clickQue").length))+"道题未复习");
        
    })
     
    //进入下一题
    $("#nextQuestion").click(function(){
     		//发送ajax
     	if((activeQuestion+1)<questions.length)	{
     		var url ="${ctx }/QuestionServlet?method=toCalculateGrades";
     		var id=activeQuestion;
     		var param="YourAnswer="+$("input[name='item']:checked").val()+"&id="+id;
     		$.post(url,param,function(resultData){
     		},"text");
     	}
        if((activeQuestion+1)!=questions.length) showQuestion(activeQuestion+1);
        showQuestion(activeQuestion);
       
    })
})
</script>
</head>
<body>
<div>
  <div class="col-md-1"></div>
  <div class="col-md-10">
    <div class="content">
      <div class="row">
        <div class="btn-group">
          <button class="btn btn-default" type="button" onclick="history.go(-1);">返回上一个页面</button>
          <button class="btn btn-default" type="button" onclick="location.reload()">刷新</button>
        </div>
      </div>
     
      <div style="width: 100%;height:auto;display: inline-block;border: 1px solid white;position: relative;margin-top:10px;">
        <div style="width: 100%;">
          <div style="width: 80%;margin: 0px auto">
            <div style="width: 100%;height:100px;border: 1px solid #CCC;border-bottom:none;background:#FFF;">
              
              <div class="middle-top" style="width: 100%;height: 50px;border-bottom: 1px solid #CCC;background:#2D3339; position:relative;">
                
                <div class="middle-top-left pull-left" style="height: 100%; padding-left: 20px; background: rgb(35, 44, 49); color: rgb(255, 255, 255); width: 742px;">
                  <div class="pull-left" style=" width:135px;line-height:20px;height:20px;margin:15px;font-size:15px;"> 
                    <!--已做答的数量和考题总数--> 
                                      当前第<span class="questioned">1</span>题/共<span class="question_sum">17</span>题 </div>
                </div>
                
              <div class="middle-top-right text-center pull-left" style="width:160px; height: 100%;border-left: 1px solid red;position: absolute;right: 0px;">
                  <div class="stop pull-left" style="width: 50px; height: 100%;padding: 10px;"> <a href="javascript:void(0);" class="text-center" style="color: #FE6547;">
                    <div class="time-stop glyphicon glyphicon-pause"  style="width:30px;height: 30px;line-height:30px; "></div>
                    <div class="time-start glyphicon glyphicon-play"  style="width:30px;height: 30px;line-height:30px;display:none;"></div>
                    </a> </div>
                  <div class="pull-left" style="width: 100px; height: 100%;padding: 10px 0px 10px 0px;">
                    <div class="time" style="width:100px;height: 30px;line-height:30px; border-radius:15px;font-size:20px;color:#FFF;"></div>
                  </div>
                </div>   
               
                
              </div>
              
              
              <div style="width: 100%;height: 50px;font-size:15px;color: #000;line-height: 50px;padding-left: 20px;">
                <div style="color:#FFF;background: red;width: 22px;height: 22px;border-radius:11px;line-height:22px;font-size:13px; text-align: center;" class="glyphicon glyphicon-map-marker"></div>
                [单选题] 
              </div>
            </div>
            
            
            <!--题目与选项-->
            <div style="width: 100%;height:auto;display: inline-block;border: 1px solid #CCC;border-bottom:1px dashed #CCC;background:#FFF;">
              <div style="width: 100%;height: 90%;padding:20px 20px 0px 20px;"> 
	                <!--试题区域-->
	                <!--
                    	ul不能少
                    -->
	                 <!--试题区域-->
                <ul class="list-unstyled question" id="question3" name="">
                	
                	
                	<!--
                      	下面三行注释掉第一个答案就不会保存
                      -->
	                  <!--<li class="question_title"><strong>第 1 题 、</strong>下丘脑与腺垂体之间主要通过下列哪条途径联系？ </li>
	                  <li class="question_info" onclick="clickTrim(this)" id="item0">
	                	<input type="radio" name="item" value="A">&nbsp;A.神经纤维</li><li class="question_info" onclick="clickTrim(this)" id="item1"><input type="radio" name="item" value="B">&nbsp;B.神经纤维和门脉系统</li><li class="question_info" onclick="clickTrim(this)" id="item2"><input type="radio" name="item" value="C">&nbsp;C.垂体门脉系统</li><li class="question_info" onclick="clickTrim(this)" id="item3"><input type="radio" name="item" value="D">&nbsp;D.垂体束</li><li class="question_info" onclick="clickTrim(this)" id="item4"><input type="radio" name="item" value="E">&nbsp;E.轴浆运输</li>-->
	                  
                	
                    <li class="question_title">
                    	<strong></strong>
                    </li>
                    <li class="question_info" onclick="clickTrim(this)" id="item0">
                		<input type="radio" name="item" value="A">&nbsp;</li>
                	<li class="question_info" onclick="clickTrim(this)" id="item1">
                		<input type="radio" name="item" value="B">&nbsp;
                	</li>
                	<li class="question_info" onclick="clickTrim(this)" id="item2">
                		<input type="radio" name="item" value="C">&nbsp;
                	</li>
                	<li class="question_info" onclick="clickTrim(this)" id="item3">
                		<input type="radio" name="item" value="D">&nbsp;</li>
                	<li class="question_info" onclick="clickTrim(this)" id="item4">
                		<input type="radio" name="item" value="E">&nbsp;
                	</li>
	                  
	                </ul>
		                <!--考题的操作区域-->
		               <div class="operation" style="margin-top: 20px;">
		                  <div class="text-left" style="margin-left:20px;font-size: 15px;float: left;line-height: 30px;">
		                    <div id="unHeart" style="color:#999999;"> <span class="glyphicon glyphicon-heart-empty"></span> <span>收藏本题</span> </div>
		                    <div id="heart" style="color:#C40000;display: none;"> <span class="glyphicon glyphicon-heart"></span> <span>已收藏</span> </div>
		                  </div>
		                  
		                  <div class="text-right" style="margin-right: 20px;">
		                    <div class="form-group" style="color: #FFF;">
		                   
		                      <button class="btn btn-success" id="submitQuestions" type="submit">返回主界面</button>
		                      <button class="btn btn-info" id="nextQuestion" type="button">下一题</button>
		                    </div>
		                  </div>
		                </div>
		                
		                
		                
              </div>
            </div>
            
          
          
        </div>
      </div>
    </div>
			    <div style="width: 100%;height: auto;display: inline-block;border: 1px solid white;">
			      <div class="text-center" style="width: 100%;"> 底部 </div>
			    </div>
  </div>
</div>
<div class="col-md-1"></div>
</div>

</body></html>