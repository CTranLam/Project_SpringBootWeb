<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var = "buildingAPI" value = "/api/building"/>
<html>
<head>
    <title>Sửa hoặc thêm toà nhà</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>
                <li class="active">Edit/Add Building</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">

            <div class="page-header">
                <div class="page-header">
                    <h1>
                        Sửa hoặc thêm toà nhà
                    </h1>
                </div><!-- /.page-header -->

                <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                    <form:form id="listForm" modelAttribute="buildingEdit" method="GET">
                        <div class="col-xs-12">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-xs-3">Tên toà nhà</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="name" /><!--name chinh la key-->
                                    </div>
                                </div>

                              <div class="form-group">
                                <label class="col-xs-3">Quận</label>
                                <div class="col-xs-2">
                                  <form:select class="form-control" path="district">
                                    <form:option value="">--Chọn Quận--</form:option>
                                    <form:options items="${districts}"/>
                                  </form:select>
                                </div>
                              </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Phường </label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="text" id="ward" name="ward" value = "">--%>
                                        <!--value la input-->
                                        <form:input class = "form-control" path = "ward"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Đường</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="text" id="street" name="street" value = "">--%>
                                        <form:input class = "form-control" path = "street"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Kết cấu</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="text" id="structure" name="structure" value = "">--%>
                                        <form:input class = "form-control" path = "structure"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Số tầng hầm</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="number" id="numberofbasement" name="numberOfBasement" value = "">--%>
                                        <form:input class = "form-control" path = "numberOfBasement"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Diện tích sàn</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="number" id="floorarea" name="floorArea" value = "">--%>
                                        <form:input class = "form-control" path = "floorArea"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Hướng</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="text" id="direction" name="direction" value = "">--%>
                                        <form:input class = "form-control" path = "direction"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Hạng</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="text" id="level" name="level" value = "">--%>
                                        <form:input class = "form-control" path = "level"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Diện tích thuê</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="text" id="rentarea" name="rentArea" value = "">--%>
                                        <form:input class = "form-control" path = "rentArea"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Giá thuê</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="number" id="rentprice" name="rentPrice" value = "">--%>
                                        <form:input class = "form-control" path = "rentPrice"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Mô tả giá</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="text" id="rentpricedescription" name="rentPriceDescription" value = "">--%>
                                        <form:input class = "form-control" path = "rentPriceDescription"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Phí dịch vụ</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="number" id="servicefee" name="serviceFee" value = "">--%>
                                        <form:input class = "form-control" path = "serviceFee"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Phí ô tô</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="number" id="carfee" name="carFee" value = "">--%>
                                        <form:input class = "form-control" path = "carFee"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Phí mô tô</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="number" id="motorbikefee" name="motorbikeFee" value = "">--%>
                                        <form:input class = "form-control" path = "motoFee"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Phí ngoài giờ</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="number" id="overtimefee" name="overtimeFee" value = "">--%>
                                        <form:input class = "form-control" path = "overtimeFee"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Tiền nước</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="number" id="waterfee" name="waterFee" value = "">--%>
                                        <form:input class = "form-control" path = "waterFee"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Tiền điện</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="number" id="electricityfee" name="electricityFee" value = "">--%>
                                        <form:input class = "form-control" path = "electricityFee"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Đặt cọc</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="number" id="deposit" name="deposit" value = "">--%>
                                        <form:input class = "form-control" path = "deposit"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Thanh toán</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="number" id="payment" name="payment" value = "">--%>
                                        <form:input class = "form-control" path = "payment"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Thời gian thuê</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="number" id="renttime" name="rentTime" value = "">--%>
                                        <form:input class = "form-control" path = "rentTime"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Thời gian trang trí</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="number" id="decorationtime" name="decorationTime" value = "">--%>
                                        <form:input class = "form-control" path = "decorationTime"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Tên quản lý</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="text" id="managername" name="managerName" value = "">--%>
                                        <form:input class = "form-control" path = "managerName"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Số điện thoại quản lý</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="text" id="managerphonenumber" name="managerPhoneNumber" value = "">--%>
                                        <form:input class = "form-control" path = "managerPhone"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Phí môi giới</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="number" id="brokeragefee" name="brokerageFee" value = "">--%>
                                        <form:input class = "form-control" path = "brokerageFee"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Loại toà nhà</label>
                                    <div class="col-xs-9">
                                        <form:checkboxes items="${typeCodes}" path = "typeCode"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Ghi chú</label>
                                    <div class="col-xs-9">
<%--                                        <input class="form-control" type="text" id="note" name="note" value = "">--%>
                                        <form:input class = "form-control" path = "note"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3"> </label>
                                    <div class="col-xs-9">
                                        <c:if test="${not empty buildingEdit.id}">
                                            <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding"> Cập nhật toà nhà
                                            </button>
                                            <button type="button" class="btn btn-danger" id = "btnCancel"> Huỷ thao tác</button>
                                        </c:if>
                                        <c:if test="${empty buildingEdit.id}">
                                            <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding"> Thêm mới toà nhà
                                            </button>
                                            <button type="button" class="btn btn-danger" id = "btnCancel"> Huỷ thao tác</button>
                                        </c:if>
                                    </div>
                                </div>
                                <form:hidden path="id" id = "buildingId"/>
                            </form>
                        </div>
                    </form:form>
                </div>
            </div><!-- /.page-content -->
        </div>
        <script>
            $("#btnAddOrUpdateBuilding").click(function () {
                var data = {};
                var typeCode = [];
                var fromData = $("#listForm").serializeArray();
                $.each(fromData, function (i, field) {
                    if (field.name != "typeCode") {
                        data["" + field.name +""] = field.value;
                    } else {
                        typeCode.push(field.value);
                    }
                });
                data["typeCode"] = typeCode;
                if(typeCode != ""){
                    addOrUpdateBuilding(data)
                }
                else{
                    window.location.href= "<c:url value="/admin/building-edit?typeCode = require"/>";
                }
            });


            function addOrUpdateBuilding(data){
                // call api
                $.ajax({
                    type: "POST",
                    url: "${buildingAPI}",
                    contentType: "application/json",
                    data: JSON.stringify(data), // client gửi dữ liệu dưới dạng JSON
                    dataType: "JSON", // Định dạng dữ liệu trả ra
                    success: function (respond) {
                        console.log("Thêm toà nhà thành công");
                    },
                    error: function (respond) {
                        console.log("Thêm toà nhà thất bại");
                        console.log(respond);
                    }
                })
            }
            $("#btnCancel").click(function (){
                window.location.href="/admin/building-list"
            })
        </script>
</body>
</html>
