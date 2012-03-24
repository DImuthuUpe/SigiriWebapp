<%-- 
    Document   : item
    Created on : Mar 9, 2012, 11:18:37 PM
    Author     : Pancha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="icon" href="images/logo_link.png">
        <title>Sigiri - Stock Management</title>
        <link rel="stylesheet" href="css/div_styles.css" type="text/css" />
        <link rel="stylesheet" href="verticaltabs/css/verticaltabs.css" />
        <link rel="stylesheet" href="css/formstyle.css" type="text/css"/>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="verticaltabs/js/verticaltabs.pack.js"></script> <!--http://dean.edwards.name/packer/-->


        <script type="text/javascript" src="js/jquery.table.addrow.js"></script>
        <script type="text/javascript">
            $("document").ready(function(){
                $("#textExample").verticaltabs({speed: 500,slideShow: false,activeIndex:0});
                $(".alternativeRow").btnAddRow({oddRowCSS:"oddRow",evenRowCSS:"evenRow"});
                $(".delRow").btnDelRow();
            });
        </script>

    </head>

    <body>

        <div class="container">
            <table width="100%" height="114">
                <tr>
                    <td width="116" height="108"><center><img src="images/logo.png"/></center></td>
                    <td width="612" style="padding-left:8px;color:#000079;font-size:20px;font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">

                        <p>Sigiri Textile Industries (Pvt) Ltd.        </p>
                        <p>No:227/1,
                            Galle Road,Katubedda,
                            Mt.Lavinia,
                    Sri Lanka. </p></td>
                    <td width="458">&nbsp;</td>
                </tr>
            </table>

            <!-- Text Example -->
            <div class="verticalslider" id="textExample" style="height:800px;">
                <ul class="verticalslider_tabs">
                    <li style="margin-top:25px;"><a href="#">Item Configuration</a></li>
                    <li><a href="#">Add Item</a></li>
                    <li><a href="#">Search Item</a></li>
                    <li><a href="#">Edit Item</a></li>
                    <li><a href="#">Item List</a></li>


                </ul>
                <ul class="verticalslider_contents">
                    <li>


                    </li>

                    <li style="padding-left:10px;">

                        <form action="AddCategory.action" method="post">

                            <fieldset style="height:60px;width:850px;">
                                <legend>Add Material Category</legend>
                                <div>
                                    <p><label for="input-one" class="float" style="padding-left:50px;width:150px;"><strong>Category Name:</strong></label>
                                        <input class="inp-text" name="category.name" type="text" size="30"/><br/>
                                        <input class="submit-button" type="submit" alt="SUBMIT" name="Submit" value="Add" style="width:80px; margin-top:-30px;"/>
                                    </p>
                                </div>
                            </fieldset>
                        </form>


                        <fieldset style="height:60px;width:850px;">
                            <legend>Add Material Sub Category</legend>
                            <div>
                                <p><label for="input-one" class="float" style="width:140px;height:25px;"><strong>Category Name:</strong></label>
                                <select name="menu" style="width:150px;" id="category1" onchange="categoryOnSelect()">
                                    <option value="0" selected>Select Category</option>
                                    <s:iterator value="catlist" var="category">
                                        <option value="${category.id}">${category.name}</option>
                                    </s:iterator>
                                </select>
                                <script type="text/javascript">
                                    function categoryOnSelect(){
                                        $('#hdncat').val($('#category1').val());
                                    }
                                </script>

                                <div style="height:50px;width:550px;margin-left:330px;margin-top:-30px;">
                                    <form action="AddSubCategory.action" >
                                        <p><label for="input-one" class="float" style="width:140px;"><strong>Sub Category Name:</strong></label>
                                            <input type="hidden" id="hdncat"  name="catId"/>
                                            <input class="inp-text" name="name" type="text" size="30" style="width:200px;"/>
                                            <input class="submit-button" type="submit" alt="SUBMIT" name="Submit" value="Add" style="width:80px; margin-top:-30px;"/>
                                        </p>
                                    </form>
                                </div>
                            </div>
                        </fieldset>



                        <fieldset style="height:320px;width:850px;">
                            <legend>Add Material Items</legend>
                            <div>
                                <p><label for="input-one" class="float" style="width:150px;height:25px;"><strong>Category Name:</strong></label>

                                <select style="width:150px;" onchange="category2OnChange()" id="category2">
                                    <option value="0" selected>Select Category</option>
                                    <s:iterator value="catlist" var="category">
                                        <option value="${category.id}">${category.name}</option>
                                    </s:iterator>
                                </select>
                                <script type="text/javascript">
                                    function setHdnSubcat(){
                                        document.getElementById('hdnSubcat').value=document.getElementById('subcat1').value;
                                    }
                                    function category2OnChange(){
                                        var catId = $('#category2').val();

                                        var str='<option value="0" selected>Select Sub Category</option>';
                                            <s:iterator value="subcatlist" var="scategory">
                                                    if(catId==${scategory.category.id}){
                                                        str=str+'<option value="${scategory.id}" >${scategory.name}</option>';
                                                    }
                                            </s:iterator>
                                                    $('#subcat1').html(str);
                                                    setHdnSubcat();
                                                }
                                </script>

                                <div style="height:50px;width:550px;margin-left:450px;margin-top:-34px;">
                                    <p>
                                    <label for="input-one" class="float" style="width:150px;height:25px;"><strong>Sub Category Name:</strong></label>

                                    <select name="menu" style="width:150px;" id="subcat1" onchange="setHdnSubcat()">


                                    </select>

                                </div>
                                <form action="AddItem.action">
                                    <input type="hidden" name="subCatId" id="hdnSubcat"/>
                                    <div style="height:200px;width:830px;overflow:auto;margin-left:2%;">
                                        <style>
                                            .atable{

                                                margin-left:10px;

                                            }
                                            .atable th{

                                                background:#BFBFFF;
                                                font-weight:bold;

                                            }
                                            .atable td{
                                                padding:4px;
                                                -webkit-border-radius:5px;
                                            }
                                            .oddRow{
                                                background:#FFFFFF;
                                            }
                                            .evenRow{
                                                background:#64B1FF;
                                            }
                                        </style>

                                        <table class="atable" id="item_table">
                                            <tr>
                                                <td><input type="button" value="Add Row" class="alternativeRow"/></td>
                                                <td><h4 align="center">ID Code</h4></td>
                                                <td><h4 align="center">Name</h4></td>
                                                <td><h4 align="center">Type</h4></td>
                                                <td><h4 align="center">Purpose</h4></td>
                                                <td><h4 align="center">Re-Order</h4></td>
                                                <td></td>
                                            </tr>

                                            <tr>
                                                <td></td>
                                                <td><input type="text" size="15" name="id"/></td>
                                                <td><input type="text" size="18" name="name"/></td>
                                                <td>
                                                    <select style="width:100px;" id="typemenu">
                                                        <option value="0" selected>Select </option>
                                                        <option value="Solid">Solid</option>
                                                        <option value="Liquid">Liquid</option>
                                                    </select>
                                                    <input type="hidden" name="type" value="kk" id="hdnType"/>
                                                </td>
                                                <td><input type="text" size="15" name="purpose"/></td>
                                                <td><input type="text" size="10" name="reorder"/></td>
                                                <td><img src="images/cross.png" class="delRow" border="0"></td>
                                            </tr>

                                        </table>

                                    </div>
                                    <script type="text/javascript">
                                        function setHiddenValues(){
                                            var rows = document.getElementById('item_table').rows;
                                            for(i=1;i<rows.length;i++){
                                                var data = rows[i].cells[3].childNodes;
                                                var val;
                                                for(j=0;j<data.length;j++){
                                                    if(data[j].attributes!=null){
                                                        if(data[j].getAttribute('id')=='typemenu'){
                                                            val= data[j].value;
                                                        }
                                                    }
                                                }
                                                for(j=0;j<data.length;j++){
                                                    if(data[j].attributes!=null){
                                                        if(data[j].getAttribute('id')=='hdnType'){
                                                            data[j].value=val;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    </script>
                                    <p style="padding-left:600px;padding-top:20px;">
                                        <input class="reset-button" type="reset" alt="RESET" name="reset" value="Reset" onclick="setHiddenValues()"/>
                                        <input class="submit-button" type="submit" alt="SUBMIT" name="Submit" value="Submit" onclick="setHiddenValues()"/>
                                    </p>
                                </form>
                            </div>
                        </fieldset>
                    </li>

                    <li style="padding-left:10px;">


                            <fieldset style="height:500px;width:880px;">
                                <legend>Item by</legend>
                                <script type="text/javascript">
                                    function searchByCode(){
                                        var keyWord = $('#searchcode').val();
                                        var innerhtml = '<tr><td style="width:100px;height:40px;"><center>Category</center></td><td style="width:100px;height:40px;"><center>Sub Category</center></td><td style="width:100px;height:40px;"><center>Item Code</center></td><td style="width:100px;height:40px;"><center>Name</center></td><td style="width:100px;height:40px;"><center>Type</center></td><td style="width:100px;height:40px;"><center>Purpose</center></td><td style="width:100px;height:40px;"><center>Re-Order</center></td></tr>';
                                        <s:iterator value="itemlist" var="item">
                                                if('${item.code}'.search(new RegExp(keyWord, 'i'))>=0){
                                                    innerhtml = innerhtml + '<tr><td style="width:100px;height:40px;"><center>${item.subCategory.category.name}</center></td><td style="width:100px;height:40px;"><center>${item.subCategory.name}</center></td><td style="width:100px;height:40px;"><center>${item.code}</center></td><td style="width:100px;height:40px;"><center>${item.name}</center></td><td style="width:100px;height:40px;"><center>${item.type}</center></td><td style="width:100px;height:40px;"><center>${item.purpose}</center></td><td style="width:100px;height:40px;"><center>${item.reorder}</center></td></tr>';
                                                }
                                        </s:iterator>
                                        $('#searchTable').html(innerhtml);

                                    }

                                    function searchByName(){
                                        var keyWord = $('#searchname').val();
                                        var innerhtml = '<tr><td style="width:100px;height:40px;"><center>Category</center></td><td style="width:100px;height:40px;"><center>Sub Category</center></td><td style="width:100px;height:40px;"><center>Item Code</center></td><td style="width:100px;height:40px;"><center>Name</center></td><td style="width:100px;height:40px;"><center>Type</center></td><td style="width:100px;height:40px;"><center>Purpose</center></td><td style="width:100px;height:40px;"><center>Re-Order</center></td></tr>';
                                        <s:iterator value="itemlist" var="item">
                                                if('${item.name}'.search(new RegExp(keyWord, 'i'))>=0){
                                                    innerhtml = innerhtml + '<tr><td style="width:100px;height:40px;"><center>${item.subCategory.category.name}</center></td><td style="width:100px;height:40px;"><center>${item.subCategory.name}</center></td><td style="width:100px;height:40px;"><center>${item.code}</center></td><td style="width:100px;height:40px;"><center>${item.name}</center></td><td style="width:100px;height:40px;"><center>${item.type}</center></td><td style="width:100px;height:40px;"><center>${item.purpose}</center></td><td style="width:100px;height:40px;"><center>${item.reorder}</center></td></tr>';
                                                }
                                        </s:iterator>
                                        $('#searchTable').html(innerhtml);

                                    }

                                    function searchByType(){
                                        var keyWord = $('#searchtype').val();
                                        var innerhtml = '<tr><td style="width:100px;height:40px;"><center>Category</center></td><td style="width:100px;height:40px;"><center>Sub Category</center></td><td style="width:100px;height:40px;"><center>Item Code</center></td><td style="width:100px;height:40px;"><center>Name</center></td><td style="width:100px;height:40px;"><center>Type</center></td><td style="width:100px;height:40px;"><center>Purpose</center></td><td style="width:100px;height:40px;"><center>Re-Order</center></td></tr>';
                                        <s:iterator value="itemlist" var="item">
                                                if('${item.type}'.search(new RegExp(keyWord, 'i'))>=0){
                                                    innerhtml = innerhtml + '<tr><td style="width:100px;height:40px;"><center>${item.subCategory.category.name}</center></td><td style="width:100px;height:40px;"><center>${item.subCategory.name}</center></td><td style="width:100px;height:40px;"><center>${item.code}</center></td><td style="width:100px;height:40px;"><center>${item.name}</center></td><td style="width:100px;height:40px;"><center>${item.type}</center></td><td style="width:100px;height:40px;"><center>${item.purpose}</center></td><td style="width:100px;height:40px;"><center>${item.reorder}</center></td></tr>';
                                                }
                                        </s:iterator>
                                        $('#searchTable').html(innerhtml);

                                    }
                                </script>

                                <p><label for="input-one" class="float" style="padding-left:50px;width:120px;"><strong>Item Code:</strong></label>
                                    <input class="inp-text" name="input-code" id="searchcode" type="text" size="30"/><br/>
                                    <input class="reset-button" type="reset" alt="RESET" name="reset" value="Reset" />
                                    <input onclick="searchByCode()" class="submit-button" type="button" alt="SUBMIT" name="Submit" value="Search" style="width:80px; margin-top:-30px;"/>
                                </p>
                                <p><label for="input-two" class="float" style="padding-left:50px;width:120px;"><strong>Item Name:</strong></label>
                                    <input class="inp-text" name="input-name" id="searchname" type="text" size="30"/><br/>
                                    <input class="reset-button" type="reset" alt="RESET" name="reset" value="Reset" />
                                    <input onclick="searchByName()" class="submit-button" type="button" alt="SUBMIT" name="Submit" value="Search" style="width:80px; margin-top:-30px;"/>
                                </p>
                                <p><label for="input-three" class="float" style="padding-left:50px;width:120px;"><strong>Item Type:</strong></label>
                                    <input class="inp-text" name="input-type" id="searchtype" type="text" size="30"/><br/>
                                    <input class="reset-button" type="reset" alt="RESET" name="reset" value="Reset" />
                                    <input onclick="searchByType()" class="submit-button" type="button" alt="SUBMIT" name="Submit" value="Search" style="width:80px; margin-top:-30px;"/>
                                </p>
                                <ul>

                                </ul>

                                <div style="height:200px;background-color:#666;width:860px;margin-left:5px;margin-top:10px;">
                                    <table id="searchTable" width="860" border="1" style="background-color:#64B1FF;font-family:'Lucida Sans Unicode', 'Lucida Grande',   sans-serif;color:#FFF;font-size:14px;font-weight:bold;-webkit-border-radius:5px;">
                                        
                                    </table>
                                </div>


                            </fieldset>


                       

                    </li>

                    <li style="padding-left:10px;">

                        <form action="EditItem.action">

                            <fieldset style="height:500px;width:600px;margin-top:10px;">
                                <legend>Edit Item</legend>



                                <p><label for="input-one" class="float" ><strong>Select:</strong></label>
                                    <script type="text/javascript">
                                        function setHdnSubcat2(){
                                            document.getElementById('hdnSubcat2').value=document.getElementById('subcat3').value;
                                        }
                                        function setHdnId2(){
                                            document.getElementById('hdnId2').value=document.getElementById('itemlist').value;
                                        }
                                        function setHdnType2(){
                                            document.getElementById('hdnType2').value=document.getElementById('edittype').value;
                                        }
                                        function category3OnChange(){
                                            var catId = $('#category3').val();

                                            var str='<option value="0" selected>Select Sub Category</option>';
                                            <s:iterator value="subcatlist" var="scategory">
                                                    if(catId==${scategory.category.id}){
                                                        str=str+'<option value="${scategory.id}" >${scategory.name}</option>';
                                                    }
                                            </s:iterator>
                                                    $('#subcat3').html(str);
                                                    setHdnSubcat2();
                                                }
                                                function itemOnSelect(){
                                                    var itemId= $('#itemlist').val();
                                            <s:iterator value="itemlist" var="item">
                                                    if('${item.id}'==itemId){
                                                        $('#editname').val('${item.name}');
                                                        $('#editcode').val('${item.code}');
                                                        $('#editpurpose').val('${item.purpose}');
                                                        $('#editreorder').val('${item.reorder}');
                                                        //var index = document.getElementById('editcategory').items.FindIndexByValue('${item.subCategory.category.id}');
                                                        var catsel =document.getElementById('category3').options;
                                                        var index=0;
                                                        for(i=0;i<catsel.length;i++){
                                                            if(catsel[i].value=='${item.subCategory.category.id}'){
                                                                index=i;
                                                                break;
                                                            }
                                                        }
                                                        if(index!=0){
                                                            catsel[index].selected=true;
                                                        }
                                                        category3OnChange();

                                                        var subcatsel =document.getElementById('subcat3').options;
                                                        var index=0;
                                                        for(i=0;i<subcatsel.length;i++){
                                                            if(subcatsel[i].value=='${item.subCategory.id}'){
                                                                index=i;
                                                                break;
                                                            }
                                                        }
                                                        if(index!=0){
                                                            subcatsel[index].selected=true;
                                                        }

                                                        var typesel =document.getElementById('edittype').options;
                                                        var index=0;
                                                        for(i=0;i<typesel.length;i++){
                                                            if(typesel[i].value=='${item.type}'){
                                                                index=i;
                                                                break;
                                                            }
                                                        }
                                                        if(index!=0){
                                                            typesel[index].selected=true;
                                                        }
                                                        setHdnType2();
                                                        setHdnSubcat2();
                                                        setHdnId2();

                                                    }
                                            </s:iterator>
                                                }
                                    </script>
                                    <select style="width:310px;" onchange="itemOnSelect()" id="itemlist">
                                        <option value="0" selected>Select Item</option>
                                        <s:iterator value="itemlist" var="item">
                                            <option value="${item.id}">${item.name}</option>
                                        </s:iterator>
                                    </select>
                                </p>
                                <input name="subcatId" type="hidden" id="hdnSubcat2"/>
                                <input name="item.type" type="hidden" id="hdnType2"/>
                                <input name="item.id" type="hidden" id="hdnId2"/>

                                <p><label for="input-two" class="float" ><strong>Category:</strong></label><br/>
                                    <select name="menu" style="width:310px;" id="category3" onchange="category3OnChange()">
                                        <option value="0" selected>Select Category</option>
                                        <s:iterator value="catlist" var="category">
                                            <option value="${category.id}" >${category.name}</option>
                                        </s:iterator>
                                    </select>
                                </p>
                                <P><label for="input-three" class="float"  ><strong>Sub Category:</strong></label><br />
                                <select name="menu" style="width:310px;" id="subcat3" onchange="setHdnSubcat2()">
                                </select>

                                <p><label for="input-four" class="float"><strong>Name:</strong></label>
                                <input class="inp-text" name="item.name" id="editname" type="text" size="30"/></p>

                                <p><label for="input-five" class="float"><strong>Item Code:</strong></label>
                                <input class="inp-text" name="item.code" id="editcode" type="text" size="30"/></p>

                                <p><label for="input-six" class="float"><strong>Type:</strong></label>
                                    <select  style="width:310px;" id="edittype" onchange="setHdnType2()">
                                        <option value="0" selected>Select </option>
                                        <option value="Solid">Solid</option>
                                        <option value="Liquid">Liquid</option>
                                    </select>
                                </p>

                                <p><label for="input-seven" class="float"><strong>Purpose:</strong></label>
                                <input class="inp-text" name="item.purpose" id="editpurpose" type="text" size="30"/></p>

                                <p><label for="input-eight" class="float"><strong>Re-Order</strong></label>
                                <input class="inp-text" name="item.reorder" id="editreorder" type="text" size="30"/></p>



                                <p style="padding-left:300px;"><input class="submit-button" type="submit" alt="SUBMIT" name="Submit" value="Update" />

                                </p>

                            </fieldset>


                        </form>
                    </li>
                    <li style="padding-left:10px;">

                        <form action="#" method="post">

                            <fieldset style="height:500px;width:880px;">
                                <legend>Item List</legend>
                                <div style="height:200px;background-color:#666;width:860px;margin-left:5px;margin-top:10px;">
                                    <table width="860" border="1" style="background-color:#64B1FF;font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;color				:#FFF;font-size:14px;font-weight:bold;-webkit-border-radius:5px;">
                                        <tr>
                                            <td style="width:100px;height:40px;"><center>Category</center></td>
                                            <td style="width:100px;height:40px;"><center>Sub Category</center></td>
                                            <td style="width:100px;height:40px;"><center>Item Code</center></td>
                                            <td style="width:100px;height:40px;"><center>Name</center></td>
                                            <td style="width:100px;height:40px;"><center>Type</center></td>
                                            <td style="width:100px;height:40px;"><center>Purpose</center></td>
                                            <td style="width:100px;height:40px;"><center>Re-Order</center></td>

                                        </tr>
                                        <s:iterator value="itemlist" var="item">
                                            <tr>

                                                <td style="width:100px;height:40px;">${item.subCategory.category.name}</td>
                                                <td style="width:100px;height:40px;">${item.subCategory.name}</td>
                                                <td style="width:100px;height:40px;">${item.code}</td>
                                                <td style="width:100px;height:40px;">${item.name}</td>
                                                <td style="width:100px;height:40px;">${item.type}</td>
                                                <td style="width:100px;height:40px;">${item.purpose}</td>
                                                <td style="width:100px;height:40px;">${item.reorder}</td>

                                            </tr>
                                        </s:iterator>
                                    </table>
                                </div>
                            </fieldset>
                        </form>
                    </li>

                </ul>
                <div style="padding-top:700px;padding-left:290px;">
                    <fieldset style="height:35px;width:600px;">
                        <a href="" ><h2>click here to Enter Place order</h2></a>

                    </fieldset>
                </div>
            </div>








            <table width="100%" height="100" border="1">
                <tr>
                    <td></td>
                </tr>
            </table>


        </div>

    </body>
</html>
