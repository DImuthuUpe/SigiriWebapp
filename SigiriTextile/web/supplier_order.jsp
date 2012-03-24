<%-- 
    Document   : supplier_order
    Created on : Mar 21, 2012, 2:21:35 PM
    Author     : pancha
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
    <link rel="stylesheet" type="text/css" href="css/tcal.css" />
    <link rel="stylesheet" type="text/css" href="css/themes/message_default.css">

    <script type="text/javascript" src='js/message.js'></script>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/tcal.js"></script>
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="verticaltabs/js/verticaltabs.pack.js"></script> <!--http://dean.edwards.name/packer/-->

    <script type="text/javascript">
        $(document).ready(function(){
            $("#textExample").verticaltabs({speed: 500,slideShow: false,activeIndex:0});

        });
    </script>
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.table.addrow.js"></script>
    <script type="text/javascript">
        $("document").ready(function(){
            $(".alternativeRow").btnAddRow({oddRowCSS:"oddRow",evenRowCSS:"evenRow"});
            $(".delRow").btnDelRow();
        });
    </script>
    <script type="text/javascript">
        function boxA(){
            dhtmlx.modalbox({
                title:"Configuration",
                text:"Height, widht and position can be redeined<br><br> You can use code like <div><code>onclick='dhtmlx.modalbox.hide(this)'</code></div> to close a modal box <br/><br/> <a href='#' onclick='dhtmlx.modalbox.hide(this)'>click to close</a>",
                width:"450px",
                height:"300px"
            });
        }
        function boxB(){
            dhtmlx.modalbox({
                text:"Do You want to Submit Purchase Order ?",
                width:"450px",
                position:"top",
                buttons:["Confirm", "Deny"],
                callback:function(){
                    dhtmlx.message("Purchase Order was Submitted")
                }
            });
        }
        function boxC(){
            var box = dhtmlx.modalbox({
                title:"Configuration",
                text:"<div id='form_in_box'><div><label> Input width <input class='inform' type='text'></label></div><div><label> Input height <input class='inform' type='text'></label></div><div><label> Input details <textarea class='inform'></textarea></label></div><div><span class='dhtmlx_button'><input type='button' value='save' onclick='save_callback(this)' style='width:250px;'></span></label></div></div>",
                width:"300px"
            });
            //timeout is necessary only in IE
            setTimeout(function(){
                box.getElementsByTagName("input")[0].focus();
            },1);


        }
        function save_callback(box){
            dhtmlx.message("Saving...");
            dhtmlx.modalbox.hide(box);
        }

        function boxD(){
            dhtmlx.modalbox({
                type:"alert-error",
                title:"Critical error",
                text:"<img src='alert_medium.png'><strong>Need more <a target='blank' href='http://en.wikipedia.org/wiki/Coffee'>coffee!</a></strong><br/><br/> You can use any type of html content here - links, images, etc.",
                buttons:["Ok"]
            });
        }
        boxC();
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
<div class="verticalslider" id="textExample" style="height:1100px;">
<ul class="verticalslider_tabs">
    <li style="margin-top:25px;"><a href="#">Supplier & Operation</a></li>
    <li><a href="#">Purchase Order</a></li>
    <li><a href="#">PO Progress</a></li>
    <li><a href="#">Invoice Order</a></li>
    <li><a href="#">IO progress</a></li>
    <li><a href="#">Search Order</a></li>
    <li><a href="#">Order Progress</a></li>


</ul>
<ul class="verticalslider_contents" >
    <li>


    </li>

    <li style="padding-left:50px;">


        <!-- ============================== Fieldset 1 ============================== -->
        <fieldset style="height:670px;width:840px;">
            <legend>Add Purchase Order</legend>
            <form action="AddPurchaseOrder.action">
                <script type="text/javascript">
                    function onPOSupSelect(){
                        //alert($('#POSupSelect').val());
                        $('#hdnPOSuppId').val($('#POSupSelect').val());
                    }
                    function onPOPayTerm(){
                        //alert($('#POPaymentTerm').val());
                        $('#hdnPOPayTerm').val($('#POPaymentTerm').val());
                    }

                    function onPOPayDelivery(){
                        alert($('#PODelivery').val());
                        $('#hdnPODelivery').val($('#PODelivery').val());
                    }

                    function POCategoryOnChange(obj){
                        var cell,row;
                        cell=obj.parentNode;
                        row=cell.parentNode;
                        row = row.parentNode;
                        var data = row.childNodes;
                        for(j=0;j<data.length;j++){
                            if(data[j].childNodes.length>0){
                                var childs = data[j].childNodes;
                                for(k=0;k<childs.length;k++){
                                    if(childs[k].tagName=="CENTER"){
                                        var selects = childs[k].childNodes;
                                        if(selects[0].id=="POItemListSubCategory"){
                                            var inHtml="<option value='0' selected>Select</option>";
                                            <s:iterator value="subCatList" var="subCat">

                                                                        if("${subCat.category.id}"==obj.value){
                                                                            inHtml = inHtml+"<option value='${subCat.id}'>${subCat.name}</option>";
                                                                        }
                                            </s:iterator>
                                                                        selects[0].innerHTML=inHtml;
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }

                                                }

                                                function POSubCategoryOnChange(obj){
                                                    var cell,row;
                                                    cell=obj.parentNode;
                                                    row=cell.parentNode;
                                                    row = row.parentNode;
                                                    var data = row.childNodes;
                                                    for(j=0;j<data.length;j++){
                                                        if(data[j].childNodes.length>0){
                                                            var childs = data[j].childNodes;
                                                            for(k=0;k<childs.length;k++){
                                                                if(childs[k].tagName=="CENTER"){
                                                                    var selects = childs[k].childNodes;
                                                                    if(selects[0].id=="POItemList"){
                                                                        var inHtml="<option value='0' selected>Select</option>";
                                            <s:iterator value="itemList" var="item">

                                                                        if("${item.subCategory.id}"==obj.value){
                                                                            inHtml = inHtml+"<option value='${item.id}'>${item.name}</option>";
                                                                        }
                                            </s:iterator>
                                                                        selects[0].innerHTML=inHtml;
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }

                                                }

                </script>
                <input type="hidden" id="hdnPOSuppId" name="suppId" value="0"/>
                <input type="hidden" id="hdnPOPayTerm" name="paymentTerm" value="0"/>
                <input type="hidden" id="hdnPODelivery" name="deliveryTo" value="0"/>
                <p><label for="input-three" class="float"><strong>Supplier:</strong></label>
                    <select style="width:205px;" id="POSupSelect" onchange="onPOSupSelect()">
                        <option value="0" selected>Select </option>
                        <s:iterator value="suppList" var="supplier">
                            <option value="${supplier.id}" >${supplier.name}</option>
                        </s:iterator>
                </select><a href="">New</a>  </p>

                <p><label for="input-five" class="float"><strong>Order No:</strong></label>
                <input class="inp-textord" name="orderNo" type="text" size="30"/></p>

                <p><label for="input-four" class="float"><strong>Attention:</strong></label>
                <input class="inp-textord" name="attention" type="text" size="30"/></p>

                <p><label for="input-three" class="float"><strong>Payment Terms:</strong></label>
                    <select style="width:205px;" id="POPaymentTerm" onchange="onPOPayTerm()">
                        <option value="0" selected>Select </option>
                        <option value="Cash">Cash</option>
                        <option value="Cheque">Cheque</option>
                        <option value="Loan">Loan</option>
                </select>  </p>


                <div style="height:200px;width:400px;margin-left:450px;margin-top:-160px;position:absolute;">

                    <p style="padding-top:25px;"><label for="input-six" class="float"><strong>Date:</strong></label>
                    <input type="text" name="dates" class="tcal" style="background-color:#FFF;width:180px;" value="" /></</p>

                    <p><label for="input-eight" class="float"><strong>Delivery Date:</strong></label>
                    <input type="text" name="deliveryDate" class="tcal" style="background-color:#FFF;width:180px;" value="" /></p>

                    <p><label for="input-three" class="float"><strong>Delivery to:</strong></label>
                        <select style="width:205px;" id="PODelivery" onchange="onPOPayDelivery()">
                            <option value="0" selected>Select </option>
                            <option value="Head Office">Head Office</option>
                            <option value="Factory">Factory</option>
                            <option value="Store">Store</option>

                    </select> </p>

                </div>


                <div style="height:234px;width:945px;overflow:auto;margin-bottom:20px;margin-left:65px;">
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

                    <table class="atable" id="POAddItems">
                        <tr>
                            <td><input type="button" value="Add" class="alternativeRow" style="width:45px;"/></td>
                            <td><h4 align="center">Category</h4></td>
                            <td><h4 align="center">Sub Category</h4></td>
                            <td><h4 align="center">Item Description</h4></td>
                            <td><h4 align="center">Unit</h4></td>
                            <td><h4 align="center">Qty</h4></td>

                            <td style="width:24px;"></td>
                        </tr>

                        <tr>
                            <td></td>
                            <td><center><select class="" style="width:100px;" onchange="POCategoryOnChange(this)" id="POItemListCategory">
                                        <option value="0" selected>Select</option>
                                        <s:iterator value="catList" var="category">
                                            <option value="${category.id}">${category.name}</option>
                                        </s:iterator>
                                    </select>
                                </center>
                            </td>
                            <td><center><select class="" style="width:100px;" id="POItemListSubCategory" onchange="POSubCategoryOnChange(this)">
                                    </select>
                                </center>
                            </td>
                            <td><center><select class="" style="width:180px;" id="POItemList">

                                    </select>
                                    <input type="hidden" name="itemId" id="POItemHdnId" value="0"/>
                                </center>
                            </td>
                            <td><center><select class="" style="width:65px;" id="POItemUnit">
                                        <option value="0" selected>Select</option>
                                        <option value="g">g</option>
                                        <option value="kg">kg</option>
                                        <option value="t">t</option>
                                    </select>
                                    <input type="hidden" name="unit" id="POItemHdnUnit" value="0"/>
                                </center>
                                
                            </td>
                            <td>
                                <input type="text" size="10" name="qty"/>
                            </td>
                            <td><img src="images/cross.png" class="delRow" border="0"></td>
                        </tr>

                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><input type="text" size="2"/></td>
                            <td><input type="text" size="10"/></td>
                            <td></td>
                        </tr>
                    </table>

                </div>

                <P><label for="label_vat" style="padding-left:50px;padding-top:20px;"><strong>VAT Registration No : 114344320-7000</strong></label></P>
                <ul>

                    <P><label for="input-nine" class="float"  style="padding-top:10px;margin-top:5px;"><strong>Notes:</strong></label><br />
                    <textarea rows="1" cols="50"  class="inp-text" name="note" style="width: 400px; height: 80px; margin: 0 0 12px 0; display: block;padding-top:10px;margin-top:40px;"></textarea> <br/></P>

                </ul>
                <script type="text/javascript">
                    function setHiddenValues(){
                        var rows = document.getElementById('POAddItems').rows;
                        for(i=1;i<rows.length;i++){
                            var data = rows[i].cells[3].childNodes;
                            if(data.length>0)
                            data = data[0].childNodes;
                            var val;
                            for(j=0;j<data.length;j++){
                                if(data[j].attributes!=null){
                                    if(data[j].getAttribute('id')=='POItemList'){
                                        val= data[j].value;
                                        
                                    }
                                }
                            }
                            for(j=0;j<data.length;j++){
                                if(data[j].attributes!=null){
                                    if(data[j].getAttribute('id')=='POItemHdnId'){
                                        data[j].value=val;
                                    }
                                }
                            }
                        }

                        //////////////////////////////////////////////////////////////

                        for(i=1;i<rows.length;i++){
                            var data = rows[i].cells[4].childNodes;
                            if(data.length>0)
                            data = data[0].childNodes;
                            var val;
                            for(j=0;j<data.length;j++){
                                if(data[j].attributes!=null){
                                    if(data[j].getAttribute('id')=='POItemUnit'){
                                        val= data[j].value;                                        
                                    }
                                }
                            }
                            for(j=0;j<data.length;j++){
                                if(data[j].attributes!=null){
                                    if(data[j].getAttribute('id')=='POItemHdnUnit'){
                                        data[j].value=val;
                                    }
                                }
                            }
                        }
                    }
                </script>
                <ul>
                    <div style="padding-left:560px;">
                        <input class="reset-button" type="reset" alt="RESET" name="reset" value="Reset" />
                        <input class="submit-button" type="submit" name="submit" value="Submit" onclick="setHiddenValues()"/>

                    </div>
                </ul>
            </form>
        </fieldset>



    </li>
    <li style="padding-left:10px;">

        <form action="#" method="post">
            <!-- ============================== Fieldset 1 ============================== -->
            <fieldset style="height:850px;width:880px;">
                <legend>Check Purchase Order</legend>
                <div style="height:200px;width:860px;margin-left:10px;margin-top:10px;">
                    <table width="860" border="1" style="background-color:#64B1FF;font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;color:#FFF;font-size:14px;font-weight:bold;-webkit-border-radius:5px;">
                        <tr>
                            <td style="width:20px;height:40px;"><center></center></td>
                            <td style="width:100px;height:40px;"><center>PO No</center></td>
                            <td style="width:100px;height:40px;"><center>Supplier</center></td>
                            <td style="width:100px;height:40px;"><center>Date</center></td>
                            <td style="width:100px;height:40px;"><center>Delivery Date</center></td>
                            <td style="width:100px;height:40px;"><center>Prepared by</center></td>

                        </tr>
                        <tr>
                            <td style="width:20px;height:40px;"><center><input type="checkbox"></center></td>
                            <td style="width:100px;height:40px;"></td>
                            <td style="width:100px;height:40px;"></td>
                            <td style="width:100px;height:40px;"></td>
                            <td style="width:100px;height:40px;"></td>
                            <td style="width:100px;height:40px;"></td>
                        </tr>
                    </table>

                </div>
                <div style="padding-left:630px;padding-bottom:20px;">
                    <p>
                        <input class="submit-button" type="submit" name="del" value="Delete" />
                        <input class="submit-button" type="submit" name="print" value="Print" />
                        <input class="submit-button" type="submit" name="submit" value="Submit" />


                    </p>
                </div>
                <div style="padding-left:30px;">

                    <p><label for="input-three" class="float"><strong>PO No:</strong></label>
                        <select name="menu" style="width:205px;">
                            <option value="0" selected>Select </option>
                            <option value="1">1</option>
                            <option value="2">2</option>

                    </select></p>

                    <p><label for="input-three" class="float"><strong>Supplier:</strong></label>
                        <select name="menu" style="width:205px;">
                            <option value="0" selected>Select </option>
                            <option value="1">1</option>
                            <option value="2">2</option>

                    </select><a href="">New</a>  </p>

                    <p><label for="input-five" class="float"><strong>Order No:</strong></label>
                    <input class="inp-textord" name="input-tqb" id="tqb" type="text" size="30"/></p>

                    <p><label for="input-four" class="float"><strong>Attention:</strong></label>
                    <input class="inp-textord" name="input-svat" id="svat" type="text" size="30"/></p>

                    <p><label for="input-three" class="float"><strong>Payment Terms:</strong></label>
                        <select name="menu" style="width:205px;">
                            <option value="0" selected>Select </option>
                            <option value="1">Cash</option>
                            <option value="2">Cheque</option>
                            <option value="2">Loan</option>
                    </select>  </p>


                    <div style="height:200px;width:400px;margin-left:480px;margin-top:-190px;position:absolute;">

                        <p style="padding-top:25px;"><label for="input-six" class="float"><strong>Date:</strong></label>
                        <input type="text" name="date" class="tcal" style="background-color:#FFF;width:180px;" value="" /></</p>

                        <p><label for="input-eight" class="float"><strong>Delivery Date:</strong></label>
                        <input type="text" name="date" class="tcal" style="background-color:#FFF;width:180px;" value="" /></p>

                        <p><label for="input-three" class="float"><strong>Delivery to:</strong></label>
                            <select name="menu" style="width:205px;">
                                <option value="0" selected>Select </option>
                                <option value="1">Head Office</option>
                                <option value="2">Factory</option>
                                <option value="2">Store</option>

                        </select> </p>

                    </div>


                    <div style="height:234px;width:945px;overflow:auto;margin-bottom:20px;margin-left:65px;">
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

                        <table class="atable">
                            <tr>
                                <td><input type="button" value="Add" class="alternativeRow" style="width:45px;"/></td>
                                <td><h4 align="center">Category</h4></td>
                                <td><h4 align="center">Sub Category</h4></td>
                                <td><h4 align="center">Item Description</h4></td>
                                <td><h4 align="center">Unit</h4></td>
                                <td><h4 align="center">Qty</h4></td>

                                <td style="width:24px;"></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td><center><select class="" name="menu" style="width:100px;">
                                            <option value="0" selected>Select</option>
                                            <option value="1">one</option>
                                            <option value="2">two</option>
                                            <option value="3">three</option>
                                        </select>
                                    </center>
                                </td>
                                <td><center><select class="" name="menu" style="width:100px;">
                                            <option value="0" selected>Select</option>
                                            <option value="1">one</option>
                                            <option value="2">two</option>
                                            <option value="3">three</option>
                                        </select>
                                    </center>
                                </td>
                                <td><center><select class="" name="menu" style="width:180px;">
                                            <option value="0" selected>Select Item</option>
                                            <option value="1">one</option>
                                            <option value="2">two</option>
                                            <option value="3">three</option>
                                        </select>
                                    </center>
                                </td>
                                <td><center><select class="" name="menu" style="width:65px;">
                                            <option value="0" selected>Select</option>
                                            <option value="1">g</option>
                                            <option value="2">kg</option>
                                            <option value="3">t</option>
                                        </select>
                                    </center>
                                </td>

                                <td>
                                    <input type="text" size="10"/>
                                </td>
                                <td><img src="images/cross.png" class="delRow" border="0"></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td><input type="text" size="2"/></td>
                                <td><input type="text" size="10"/></td>
                                <td></td>
                            </tr>
                        </table>

                    </div>

                    <ul>

                        <P><label for="input-nine" class="float"  style="padding-top:10px;margin-top:5px;"><strong>Notes:</strong></label><br />
                        <textarea rows="1" cols="50"  class="inp-text" id="address"name="input-address" style="width: 400px; height: 80px; margin: 0 0 12px 0; display: block;padding-top:10px;margin-top:40px;"></textarea> <br/></P>

                    </ul>

                    <div style="padding-left:620px;">
                        <input class="reset-button" type="reset" name="reset" value="Reset" />
                        <input class="cal-button" type="submit" name="cal" value="Calculate" />
                        <input class="submit-button" type="submit" name="save" value="Save" />
                    </div>
                </div>




            </fieldset>

        </form>
    </li>

    <li style="padding-left:10px;">

        <form action="#" method="post">
            <!-- ============================== Fieldset 1 ============================== -->
            <fieldset style="height:750px;width:880px;">
                <legend>Invoice Order</legend>

                <p><label for="input-three" class="float"><strong>Order No:</strong></label>
                    <select name="menu" style="width:205px;">
                        <option value="0" selected>Select </option>
                        <option value="1">1</option>
                        <option value="2">2</option>

                </select>  </p>

                <p><label for="input-three" class="float"><strong>Currency:</strong></label>
                    <select name="menu" style="width:205px;">
                        <option value="0" selected>Select </option>
                        <option value="1">LKR</option>
                        <option value="2">Dollar</option>

                </select><a href="">Change</a>  </p>

                <p><label for="input-four" class="float"><strong>Supplier:</strong></label>
                <input class="inp-textord" name="input-svat" id="svat" type="text" size="30"/></p>

                <p><label for="input-four" class="float"><strong>VAT No:</strong></label>
                <input class="inp-textord" name="input-svat" id="svat" type="text" size="30"/></p>




                <div style="height:200px;width:400px;margin-left:530px;margin-top:-135px;position:absolute;">


                    <p><label for="input-eight" class="float"><strong>Delivery Date:</strong></label>
                    <input type="text" name="date"  style="background-color:#FFF;width:180px;" value="" /></p>

                    <p><label for="input-six" class="float"><strong>Payment Terms:</strong></label>
                    <input type="text" name="date"  style="background-color:#FFF;width:180px;" value="" /></</p>



                </div>


                <div style="height:205px;width:945px;overflow:auto;margin-bottom:20px;margin-top:20px;">
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

                    <table class="atable">
                        <tr>
                            <td><input type="button" value="Add" class="alternativeRow" style="width:45px;"/></td>
                            <td><h4 align="center">Category</h4></td>
                            <td><h4 align="center">Sub Category</h4></td>
                            <td><h4 align="center">Item Description</h4></td>
                            <td><h4 align="center">Unit</h4></td>
                            <td><h4 align="center">Unit Price</h4></td>
                            <td><h4 align="center">Qty</h4></td>
                            <td><h4 align="center">Total Price</h4></td>

                            <td style="width:24px;"></td>
                        </tr>

                        <tr>
                            <td></td>
                            <td><center><select class="" name="menu" style="width:100px;">
                                        <option value="0" selected>Select</option>
                                        <option value="1">one</option>
                                        <option value="2">two</option>
                                        <option value="3">three</option>
                                    </select>
                                </center>
                            </td>
                            <td><center><select class="" name="menu" style="width:100px;">
                                        <option value="0" selected>Select</option>
                                        <option value="1">one</option>
                                        <option value="2">two</option>
                                        <option value="3">three</option>
                                    </select>
                                </center>
                            </td>
                            <td><center><select class="" name="menu" style="width:180px;">
                                        <option value="0" selected>Select Item</option>
                                        <option value="1">one</option>
                                        <option value="2">two</option>
                                        <option value="3">three</option>
                                    </select>
                                </center>
                            </td>
                            <td><center><select class="" name="menu" style="width:65px;">
                                        <option value="0" selected>Select</option>
                                        <option value="1">g</option>
                                        <option value="2">kg</option>
                                        <option value="3">t</option>
                                    </select>
                                </center>
                            </td>
                            <td>
                                <input type="text" size="7"/>
                            </td>
                            <td>
                                <input type="text" size="4"/>
                            </td>
                            <td>
                                <input type="text" size="10"/>
                            </td>
                            <td><img src="images/cross.png" class="delRow" border="0"></td>
                        </tr>

                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><input type="text" size="4"/></td>
                            <td><input type="text" size="9"/></td>
                            <td></td>
                        </tr>
                    </table>

                </div>
                <div style="height:160px;width:500px;background-color:#666;margin-left:200px;border-bottom-width:10px;-webkit-border-radius:6px;background-color:#64B1FF;margin-top:20px;">

                    <table width="500" height="140" >
                        <tr>
                            <td><center>With VAT</center></td>
                            <td><center>With NBT</center></td>

                        </tr>

                        <tr>
                            <td><center><input type="checkbox" name="vat" /></center></td>
                            <td><center><input type="checkbox" name="nbt" /></center></td>

                        </tr>
                        <tr>
                            <td></td>
                            <td><center>Amount</center></td>

                        </tr>
                        <tr>
                            <td><center>VAT</center></td>
                            <td><center><input type="text" name="amountNbt" size="10"/></center></td>
                        </tr>
                        <tr>
                            <td><center>NBT</center></td>
                            <td><center><input type="text" name="amountVat" size="10"/></center></td>
                        </tr>
                        <tr>
                            <td><center>Grand Total</center></td>
                            <td><center><input type="text" name="amountTot" size="10"/></center></td>
                        </tr>

                    </table>

                </div>


                <ul>

                    <P><label for="input-nine" class="float"  style="padding-top:20px;margin-top:10px;"><strong>Notes:</strong></label><br />
                    <textarea rows="1" cols="50"  class="inp-text" id="address"name="input-address" style="width: 400px; height: 80px; margin: 0 0 12px 0; display: block;padding-top:20px;margin-top:60px;"></textarea> <br/></P>

                </ul>
                <ul>
                    <div style="padding-left:560px;">
                        <input class="reset-button" type="reset" alt="RESET" name="reset" value="Reset" />
                        <input class="cal-button" type="submit" alt="CALCULATE" name="cal" value="Calculate" />
                        <input class="submit-button" type="submit" alt="SUBMIT" name="submit" value="Submit" />

                    </div>
                </ul>
            </fieldset>


        </form>
    </li>
    <li style="padding-left:10px;">

        <form action="#" method="post">
            <!-- ============================== Fieldset 1 ============================== -->

            <fieldset style="height:1020px;width:880px;">
                <legend>Approve Invoice for Purchase Order</legend>
                <div style="height:200px;width:860px;margin-left:10px;margin-top:10px;">
                    <table width="860" border="1" style="background-color:#64B1FF;font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;color			:#FFF;font-size:14px;font-weight:bold;-webkit-border-radius:5px;">
                        <tr>
                            <td style="width:20px;height:40px;"><center></center></td>
                            <td style="width:100px;height:40px;"><center>IO No</center></td>
                            <td style="width:100px;height:40px;"><center>PO No</center></td>
                            <td style="width:100px;height:40px;"><center>Supplier</center></td>
                            <td style="width:100px;height:40px;"><center>Date</center></td>
                            <td style="width:100px;height:40px;"><center>Delivery Date</center></td>
                            <td style="width:100px;height:40px;"><center>Prepared by</center></td>

                        </tr>
                        <tr>
                            <td style="width:20px;height:40px;"><center><input type="checkbox"/></center></td>
                            <td style="width:100px;height:40px;"></td>
                            <td style="width:100px;height:40px;"></td>
                            <td style="width:100px;height:40px;"></td>
                            <td style="width:100px;height:40px;"></td>
                            <td style="width:100px;height:40px;"></td>
                            <td style="width:100px;height:40px;"></td>
                        </tr>
                    </table>

                </div>
                <div style="padding-left:640px;padding-bottom:10px;">
                    <input class="submit-button" type="submit" name="del" value="Delete" />
                    <input class="submit-button" type="submit" name="print" value="Print" />
                    <input class="submit-button" type="submit" name="submit" value="Approve" />

                </div>
                <p><label for="input-three" class="float"><strong>IO No:</strong></label>
                    <select name="menu" style="width:205px;">
                        <option value="0" selected>Select </option>
                        <option value="1">1</option>
                        <option value="2">2</option>

                </select>  </p>

                <p><label for="input-three" class="float"><strong>PO No:</strong></label>
                <input class="inp-textord" name="input-svat" id="svat" type="text" size="30"/></p>

                <p><label for="input-three" class="float"><strong>Currency:</strong></label>
                    <select name="menu" style="width:205px;">
                        <option value="0" selected>Select </option>
                        <option value="1">LKR</option>
                        <option value="2">Dollar</option>

                </select><a href="">Change</a>  </p>






                <div style="height:200px;width:400px;margin-left:530px;margin-top:-100px;position:absolute;">


                    <p><label for="input-eight" class="float"><strong>Delivery Date:</strong></label>
                    <input type="text" name="date"  style="background-color:#FFF;width:180px;" value="" /></p>

                    <p><label for="input-six" class="float"><strong>Payment Terms:</strong></label>
                    <input type="text" name="date"  style="background-color:#FFF;width:180px;" value="" /></</p>



                </div>


                <div style="height:205px;width:945px;overflow:auto;margin-bottom:20px;margin-top:20px;">
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

                    <table class="atable">
                        <tr>
                            <td><input type="button" value="Add" class="alternativeRow" style="width:45px;"/></td>
                            <td><h4 align="center">Category</h4></td>
                            <td><h4 align="center">Sub Category</h4></td>
                            <td><h4 align="center">Item Description</h4></td>
                            <td><h4 align="center">Unit</h4></td>
                            <td><h4 align="center">Unit Price</h4></td>
                            <td><h4 align="center">Qty</h4></td>
                            <td><h4 align="center">Total Price</h4></td>

                            <td style="width:24px;"></td>
                        </tr>

                        <tr>
                            <td></td>
                            <td><center><select class="" name="menu" style="width:100px;">
                                        <option value="0" selected>Select</option>
                                        <option value="1">one</option>
                                        <option value="2">two</option>
                                        <option value="3">three</option>
                                    </select>
                                </center>
                            </td>
                            <td><center><select class="" name="menu" style="width:100px;">
                                        <option value="0" selected>Select</option>
                                        <option value="1">one</option>
                                        <option value="2">two</option>
                                        <option value="3">three</option>
                                    </select>
                                </center>
                            </td>
                            <td><center><select class="" name="menu" style="width:180px;">
                                        <option value="0" selected>Select Item</option>
                                        <option value="1">one</option>
                                        <option value="2">two</option>
                                        <option value="3">three</option>
                                    </select>
                                </center>
                            </td>
                            <td><center><select class="" name="menu" style="width:65px;">
                                        <option value="0" selected>Select</option>
                                        <option value="1">g</option>
                                        <option value="2">kg</option>
                                        <option value="3">t</option>
                                    </select>
                                </center>
                            </td>
                            <td>
                                <input type="text" size="7"/>
                            </td>

                            <td>
                                <input type="text" size="4"/>
                            </td>
                            <td>
                                <input type="text" size="10"/>
                            </td>
                            <td><img src="images/cross.png" class="delRow" border="0"></td>
                        </tr>

                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>

                            <td></td>
                            <td><input type="text" size="4"/></td>
                            <td><input type="text" size="9"/></td>
                            <td></td>
                        </tr>
                    </table>

                </div>
                <div style="height:160px;width:500px;background-color:#666;margin-left:200px;border-bottom-width:10px;-webkit-border-radius:6px;background-color:#64B1FF;margin-top:20px;">

                    <table width="500" height="140" >
                        <tr>
                            <td><center>With VAT</center></td>
                            <td><center>With NBT</center></td>

                        </tr>

                        <tr>
                            <td><center><input type="checkbox" name="vat" /></center></td>
                            <td><center><input type="checkbox" name="nbt" /></center></td>

                        </tr>
                        <tr>
                            <td></td>
                            <td><center>Amount</center></td>

                        </tr>
                        <tr>
                            <td><center>VAT</center></td>
                            <td><center><input type="text" name="amountNbt" size="10"/></center></td>
                        </tr>
                        <tr>
                            <td><center>NBT</center></td>
                            <td><center><input type="text" name="amountVat" size="10"/></center></td>
                        </tr>
                        <tr>
                            <td><center>Grand Total</center></td>
                            <td><center><input type="text" name="amountTot" size="10"/></center></td>
                        </tr>

                    </table>

                </div>


                <ul>

                    <P><label for="input-nine" class="float"  style="padding-top:20px;margin-top:10px;"><strong>Notes:</strong></label><br />
                    <textarea rows="1" cols="50"  class="inp-text" id="address"name="input-address" style="width: 400px; height: 80px; margin: 0 0 12px 0; display: block;padding-top:20px;margin-top:60px;"></textarea> <br/></P>

                </ul>
                <ul>
                <div style="padding-left:560px;">
                    <input class="reset-button" type="reset" name="reset" value="Reset" />
                    <input class="cal-button" type="submit" name="cal" value="Calculate" />
                    <input class="submit-button" type="submit" name="save" value="Save" />

                </div>
            </fieldset>

        </form>
    </li>

    <li style="padding-left:10px;">

        <form action="#" method="post">

            <fieldset style="height:500px;width:880px;">
                <legend>Purchase Orders by</legend>

                <p style="padding-top:5px;"><label for="input-one" class="float" ><strong>Select:</strong></label>
                    <form action="">
                    <select name="menu" style="width:310px;">
                        <option value="0" selected>Select Supplier</option>
                        <option value="1">one</option>
                        <option value="2">two</option>
                        <option value="3">three</option>
                </select></p>

                <P style="padding-top:10px;"><label for="input-two" class="float"><strong>Order No:</strong></label>
                <input class="inp-text" name="input-tqb" id="tqb" type="text" size="30"/></p>

                <p style="padding-top:10px;"><label for="input-eight" class="float" ><strong>Order Date:</strong></label>
                    <input type="text" name="ofdate" class="tcal" style="background-color:#FFF;width:180px;" value="From:"/>
                <input type="text" name="otdate" class="tcal" style="background-color:#FFF;width:180px;" value="To:" /><br /></p>

                <p style="padding-top:10px;"><label for="input-eight" class="float"><strong>Delivery Date:</strong></label><br />
                    <input type="text" name="dfdate" class="tcal" style="background-color:#FFF;width:180px;" value="From:"/>
                <input type="text" name="dtdate" class="tcal" style="background-color:#FFF;width:180px;" value="To:" /><br /></p>


                <ul>
                    <div style="padding-left:560px;">
                        <input class="reset-button" type="reset" alt="RESET" name="reset" value="Reset" />
                        <input class="submit-button" type="submit" alt="SUBMIT" name="submit" value="Submit" />

                    </div>
                </ul>

                <div style="height:200px;width:860px;margin-left:5px;margin-top:10px;">
                    <table width="860" border="1" style="background-color:#64B1FF;font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;color			:#FFF;font-size:14px;font-weight:bold;-webkit-border-radius:5px;margin-top:20px;">

                        <tr>
                            <td style="width:100px;height:40px;"><center>PO No</center></td>
                            <td style="width:100px;height:40px;"><center>Supplier</center></td>
                            <td style="width:100px;height:40px;"><center>Date</center></td>
                            <td style="width:100px;height:40px;"><center>Delivery Date</center></td>
                            <td style="width:100px;height:40px;"><center>Unit Qty</center></td>
                            <td style="width:100px;height:40px;"><center>Received Qty</center></td>


                        </tr>
                        <tr>

                            <td style="width:100px;height:40px;"></td>
                            <td style="width:100px;height:40px;"></td>
                            <td style="width:100px;height:40px;"></td>
                            <td style="width:100px;height:40px;"></td>
                            <td style="width:100px;height:40px;"></td>
                            <td style="width:100px;height:40px;"></td>
                        </tr>
                    </table>
                </div>


            </fieldset>


        </form>

    </li>


    </li>

    <li style="padding-left:10px;">

        <form action="#" method="post">

            <fieldset style="height:500px;width:880px;">
                <legend>Purchase Order Progress</legend>
                <div style="height:200px;width:860px;margin-left:10px;margin-top:10px;">
                <p><label for="input-one" class="float" ><strong>Year:</strong></label>
                    <form action="">
                        <select name="menu" style="width:80px;">
                            <option value="0" selected>2012</option>
                            <option value="1">2013</option>
                            <option value="2">2014</option>
                            <option value="3">2015</option>
                            <option value="4">2016</option>
                            <option value="5">2017</option>
                            <option value="6">2018</option>
                            <option value="7">2019</option>
                            <option value="8">2020</option>

                        </select>
                    </form>
                </p>
                <div style="height:300px;width:450px;margin-left:350px;margin-top:-35px;">
                    <p><label for="input-one" class="float" ><strong>Month:</strong></label>
                        <form action="">
                            <select name="menu" style="width:80px;">
                                <option value="0" selected>January</option>
                                <option value="1">February</option>
                                <option value="2">March</option>
                                <option value="3">April</option>
                                <option value="4">May</option>
                                <option value="5">June</option>
                                <option value="6">July</option>
                                <option value="7">August</option>
                                <option value="8">September</option>
                                <option value="9">October</option>
                                <option value="10">November</option>
                                <option value="11">December</option>
                            </select>
                        </form>
                    </p>
                </div>
                <div style="margin-left:700px;margin-top:-302px;">
                    <input class="submit-button" type="submit" alt="SUBMIT" name="submit" value="Submit" />

                </div>
                <table width="860" border="1" style="background-color:#64B1FF;font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;color			:#FFF;font-size:14px;font-weight:bold;-webkit-border-radius:5px;margin-top:20px;">

                    <tr>
                        <td style="width:100px;height:40px;"><center>PO No</center></td>
                        <td style="width:100px;height:40px;"><center>Supplier</center></td>
                        <td style="width:100px;height:40px;"><center>Date</center></td>
                        <td style="width:100px;height:40px;"><center>Delivery Date</center></td>
                        <td style="width:100px;height:40px;"><center>Unit Qty</center></td>
                        <td style="width:100px;height:40px;"><center>Received Qty</center></td>


                    </tr>
                    <tr>

                        <td style="width:100px;height:40px;"></td>
                        <td style="width:100px;height:40px;"></td>
                        <td style="width:100px;height:40px;"></td>
                        <td style="width:100px;height:40px;"></td>
                        <td style="width:100px;height:40px;"></td>
                        <td style="width:100px;height:40px;"></td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </li>

</ul>
<div style="padding-top:800px;padding-left:290px;">
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
