<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="dateValue" class="java.util.Date"/>

<html>
<head>
    <title>Title</title>
</head>
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="js/editormd.min.js"></script>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/wangEditor-fullscreen-plugin.js"></script>
<link href="css/wangEditor-fullscreen-plugin.css" rel="stylesheet">
<script src="js/main.js"></script>
<script>
    $(document).ready(function(){
        $("#w").mousemove(function(e){

            $("#w").attr("src","https://comment-1300924703.cos.ap-shanghai.myqcloud.com//img/2cad7a9b-cf23-4f71-a" +
                "cc9-cf233daeb5d8.png");
        })
            .mouseout(function(e){

                $("#w").attr("src","https://comment-1300924703.cos.ap-shanghai.myqcloud.com//img/7f1b7cbe-840e-40f3-974c-66140554aaa8.png");
            });




    });


</script>

<body >


<div style="margin: 30px" >
    <div class="col-xs-2 col-sm-2 col-md-2 color" >

          <a href="#" ><img  style="float: right;margin-top: 100px" id="w"
                             src="https://comment-1300924703.cos.ap-shanghai.myqcloud.com//img/7f1b7cbe-840e-40f3-974c-66140554aaa8.png"
                             width="36" height="36">
          </a>
         <h2>title</h2>
       <br>
       <p >2条</p>

        <hr class="col-xs-12 col-sm-12 col-md-12">

       <div>


         <c:forEach items="${nodes}" var="node">
        <div class="col-xs-12 col-sm-12 col-md-12 font color "  data-id="${node.getId()}"   onclick="show1(this)">
              <div  class="col-xs-12 col-sm-12 col-md-12 ">
            <div class="title" >
                 <h3>  ${node.getTitle()}</h3>
            </div>
                  <a href="delete?id=${node.getId()}">
                      <span class="glyphicon glyphicon-trash xian"  style="float: right;margin-top: -15px;" aria-hidden="true"></span> </a>
            <div style="font-size: 12px;margin-top: 5px;margin-bottom: 5px">

                <span style="font-size:18px;">
                <jsp:setProperty name="dateValue" property="time"  value= "${node.getCreatTime()}"/>
                <fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd HH:mm:ss"/>



            </div>

        </div>

        </div>
         </c:forEach>


       </div>

    </div>



    <div class="col-xs-9 col-sm-9 col-md-9" >


        <form action="/add" method="post">
            <input type="text" hidden name="nodeid" id="nodeid">
            <input type="text" hidden name="t1" id="t1">
        <button type="submit" class="btn btn-success" id="btn1" style="float: right;margin-right: -100px">完成</button>
          <div style="margin: 30px">
              <div id="div1" class="toolbar">
              </div>
              <div style="padding: 5px 0; color: #ccc">
                  <input type="text" name="title" id="title" class="form-control" style="color:#2dbe60 ;border:0;height: 50px;font-size: 30px" placeholder="笔记标题">
              </div>
              <div id="div2" class="text1" name="content" > <!--可使用 min-height 实现编辑区域自动增加高度-->


              </div>

              <script type="text/javascript" src="js/release/wangEditor.min.js"></script>
              <script type="text/javascript">
                  var E = window.wangEditor
                  var editor1 = new E('#div1', '#div2');  // 两个参数也可以传入 elem 对象，class 选择器
                  editor1.create();

                  document.getElementById('btn1').addEventListener('click', function () {
                      // 读取 text
                      $("#t1").val(editor1.txt.html());
                  }, false)
                  function show1(e) {
                      var id=e.getAttribute("data-id");
                      $.ajax({
                              type:"post",
                              url:"select",
                              data:{
                                  id:id
                              },
                              success:function (data) {
                                   $("#nodeid").val(data.id);
                                  $("#title").val(  data.title);
                                  editor1.txt.html(data.content)

                              },
                              dataType:"json"
                          }

                      )
                  }
              </script>






    </div>
        </form>
    </div>
</div>


</body>

</html>
