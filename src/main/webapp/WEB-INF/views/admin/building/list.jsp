<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var = "buildingListURL" value = "/admin/building-list"/>
<c:url var = "buildingAPI" value = "/api/building"/>
<html>
<head>
    <title>Danh sách toà nhà</title>
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
                <li class="active">Search</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="widget-box ui-sortable-handle">
                        <div class="widget-header">
                            <h5 class="widget-title">Tìm kiếm</h5>

                            <div class="widget-toolbar">

                                <a href="#" data-action="collapse">
                                    <i class="ace-icon fa fa-chevron-up"></i>
                                </a>

                            </div>
                        </div>

                        <div class="widget-body" style="font-family: 'Times New Roman', Times, serif">
                            <div class="widget-main">
                                <form:form id = "listForm" modelAttribute="modelSearch" action="${buildingListURL}" method="GET">  <!--submit len param se call API, method nao-->
                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <label class="name">Tên toà nhà</label>
<%--                                                    <input type="text" class="form-control" name="name" value = "${modalSearch.name}">--%>
                                                    <form:input class="form-control" path = "name"/>
                                                </div>
                                                <div class="col-xs-6">
                                                    <label class="name">Diện tích sàn</label>
<%--                                                    <input type="number" class="form-control" name = "floorArea" value = "${modelSearch.floorArea}">--%>
                                                    <form:input class="form-control" path = "floorArea"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-2">
                                                    <label class="name">Quận</label>
                                                    <form:select class="form-control" path = "district">
                                                        <form:option value="">--Chọn Quận--</form:option>
                                                        <form:options items = "${districts}"/>
                                                    </form:select>
                                                </div>
                                                <div class="col-xs-5">
                                                    <label class="name">Phường</label>
<%--                                                    <input type="text" class="form-control" name = "ward" value="${modalSearch.ward}">--%>
                                                     <form:input class="form-control" path = "ward"/>
                                                </div>
                                                <div class="col-xs-5">
                                                    <label class="name">Đường</label>
<%--                                                    <input type="text" class="form-control" name ="street" value ="${modalSearch.street}">--%>
                                                     <form:input class="form-control" path = "street"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-4">
                                                    <label class="name">Số tầng hầm</label>
<%--                                                    <input type="text" class="form-control" name = "numberOfBasement" value ="${modelSearch.numberOfBasement}">--%>
                                                    <form:input class="form-control" path = "numberOfBasement"/>
                                                </div>
                                                <div class="col-xs-4">
                                                    <label class="name">Hướng</label>
<%--                                                    <input type="text" class="form-control" name = "direction" value = "">--%>
                                                    <form:input class="form-control" path = "direction"/>
                                                </div>
                                                <div class="col-xs-4">
                                                    <label class="name">Hạng</label>
<%--                                                    <input type="number" class="form-control" name = "level" value = "">--%>
                                                    <form:input class="form-control" path = "level"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-3">
                                                    <label class="name">Diện tích từ</label>
<%--                                                    <input type="number" class="form-control" name = "areaTo" value ="${modelSearch.areaTo}">--%>
                                                    <form:input class="form-control" path = "areaTo"/>
                                                </div>
                                                <div class="col-xs-3">
                                                    <label class="name">Diện tích đến</label>
<%--                                                    <input type="number" class="form-control" name = "areaFrom" value = "${modelSearch.areaFrom}">--%>
                                                    <form:input class="form-control" path = "areaFrom"/>
                                                </div>
                                                <div class="col-xs-3">
                                                    <label class="name">Giá thuê từ</label>
<%--                                                    <input type="number" class="form-control" name = "rentPriceTo" value = "">--%>
                                                    <form:input class="form-control" path = "rentPriceTo"/>
                                                </div>
                                                <div class="col-xs-3">
                                                    <label class="name">Giá thuê đến</label>
<%--                                                    <input type="number" class="form-control" name = "rentPriceFrom" value = "">--%>
                                                    <form:input class="form-control" path = "rentPriceFrom"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-5">
                                                    <label class="name">Tên quản lý</label>
<%--                                                    <input type="text" class="form-control" name = "managerName" value="">--%>
                                                    <form:input class="form-control" path = "managerName"/>
                                                </div>
                                                <div class="col-xs-5">
                                                    <label class="name">Số điện thoại quản lý</label>
<%--                                                    <input type="text" class="form-control" name = "managerPhone" value = "">--%>
                                                    <form:input class="form-control" path = "managerPhone"/>
                                                </div>
                                                <div class="col-xs-2">
                                                    <label class="name">Nhân viên</label>
                                                    <form:select class="form-control" path = "staffId">
                                                        <form:option value="">--Chọn nhân viên--</form:option>
                                                        <form:options items ="${listStaffs}"/>
                                                    </form:select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <form:checkboxes items="${typeCodes}" path = "typeCode"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <button type="button" class="btn btn-danger" id="btnSearchBuilding">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16"
                                                             height="16" fill="currentColor" class="bi bi-search"
                                                             viewBox="0 0 16 16">
                                                            <path
                                                                    d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0">
                                                            </path>
                                                        </svg>
                                                        Tìm kiếm
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                        </div>

                        <div class="pull-right">
                            <a href ="/admin/building-edit" class="btn btn-info" title="Thêm toà nhà">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                         fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                    <path
                                                d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                    <path
                                                d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                    <path
                                                d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                    </svg>
                            </a>
                            <button class="btn btn-danger" title="Xoá toà nhà" id = "btnDeleteBuildings">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                     fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                                    <path
                                            d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                    <path
                                            d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                    <path
                                            d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Bảng danh sách -->

            <div class="row">
                <div class="col-xs-12" style="font-family: 'Times New Roman', Times, serif;">
                    <table id="tableList" style="margin: 3em 0 1.5em;"
                           class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace" name = "checkList" value = "">
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            <th>Tên toà nhà</th>
                            <th>Địa chỉ</th>
                            <th>Số tầng hầm</th>
                            <th>Tên quản lý</th>
                            <th>Số điện thoại quản lý</th>
                            <th>Diện tích sàn</th>
                            <th>Diện tích trống</th>
                            <th>Diện tích thuê</th>
                            <th>Phí môi giới</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="item" items="${buildingReponseList}">
                            <tr>
                            <td class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace" name = "checkList" value = ${item.id}>
                                    <span class="lbl"></span>
                                </label>
                            </td>

                            <td>${item.name}</td>
                            <td>${item.address}</td>
                            <td>${item.numberOfBasement}</td>
                            <td>${item.managerName}</td>
                            <td>${item.managerPhone}</td>
                            <td>${item.floorArea}</td>
                            <td>${item.rentArea}</td>
                            <td>${item.id}</td>
                            <td>${item.id}</td>

                            <td>
                                <div class="hidden-sm hidden-xs btn-group">
                                    <button class="btn btn-xs btn-success" title="Giao toà nhà"
                                            onclick="assigmentBuilding(${item.id})">
                                        <i class="ace-icon glyphicon glyphicon-list"></i>
                                    </button>

                                    <a href="/admin/building-edit-${item.id}" class="btn btn-xs btn-info" title="Sửa toà nhà">
                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                                    </a>

                                    <button class="btn btn-xs btn-danger" title = "Xoá toà nhà" onclick="deleteBuilding(${item.id})">
                                        <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                    </button>

                                </div>
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div><!-- /.span -->
            </div>
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->
<div class="modal fade" id="assigmentBuildingModal" role="dialog" style = "font-family: 'Times New Roman', Times, serif;">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Danh sách nhân viên</h4>
				</div>

				<div class="modal-body">
					<table class="table table-striped table-bordered table-hover" id = "staffList">
								<thead>
									<tr>
										<th class = "center">Chọn</th>
										<th>Tên nhân viên</th>
									</tr>
								</thead>

								<tbody>
<%--									<tr>--%>
<%--										<td class="center">--%>
<%--											<input type="checkbox" id = "checkbox_2" value = "3">--%>
<%--										</td>--%>

<%--										<td>Trần Văn C</td>--%>
<%--									</tr>--%>
								</tbody>
							</table>
							<input type="hidden" id = "buildingid" name = "buildingId" value = "">
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" id = "btnassignmentBuilding">Giao toà nhà</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
				</div>
			</div>

		</div>
	</div>

<script>
// jquery ajax load staff
    function assigmentBuilding(buildingId) {
        $('#assigmentBuildingModal').modal();
        loadStaff(buildingId)
        $('#buildingid').val(buildingId);
    }

    function loadStaff(buildingId){
        $.ajax({
            type: "GET",
            url: "${buildingAPI}/" +buildingId  + '/staffs',
            // contentType: "application/json",
            // data: JSON.stringify(data), // client gửi dữ liệu dưới dạng JSON(body) => do day ve dang param nen khong can
            dataType: "json", // Định dạng dữ liệu trả ra
            success: function (response) {
                var row = "";
                $.each(response.data, function (index, item) {
                    // dấu ' ' bao quanh toàn bộ chuỗi JavaScript khi bạn viết HTML trong JS.
                    row += '<tr>';
                    row += '<td class="center"> <input type="checkbox" value="'
                        + item.staffId
                        + '" id="checkbox_' + item.staffId + '" '
                        + item.checked
                        + ' /> </td>';
                    row += '<td class="center">' + item.fullName + '</td>';
                    row += '</tr>';
                });
                $('#staffList tbody').html(row);
                console.info("Success");
            },
            error: function (response) {
                console.log("Thêm toà nhà thất bại");
                window.location.href= "<c:url value="/admin/building-list?message = error"/>";
                console.log(response);
            }
        })
    }

// jquery ajax assignmentBuilding
    $('#btnassignmentBuilding').click(function(e){
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingid').val();
        var staffs = $('#staffList').find('tbody input[type="checkbox"]:checked').map(function(){
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        if(data['staffs'] != ""){
            assignment(data)
        }
        console.log("ok");
    })
    function assignment(data){
        $.ajax({
            type: "POST",
            url: "${buildingAPI}/" +"assignment",
            contentType: "application/json",// client gửi dữ liệu dưới dạng JSON(body)
            data: JSON.stringify(data),
            dataType: "json", // Định dạng dữ liệu trả ra
            success: function (response) {
                var row = "";
                $.each(response.data, function (index, item) {
                    // dấu ' ' bao quanh toàn bộ chuỗi JavaScript khi bạn viết HTML trong JS.
                    row += '<tr>';
                    row += '<td class="center"> <input type="checkbox" value="'
                        + item.staffId
                        + '" id="checkbox_' + item.staffId + '" '
                        + item.checked
                        + ' /> </td>';
                    row += '<td class="center">' + item.fullName + '</td>';
                    row += '</tr>';
                });
                $('#staffList tbody').html(row);
                console.info("Success");
            },
            error: function (response) {
                console.info("Giao khong thanh cong")
                window.location.href= "<c:url value="/admin/building-list?message = error"/>";
                console.log(response);
            }
        })
    }





    $('#btnSearchBuilding').click(function (e){
       e.preventDefault();
       $('#listForm').submit(); //sent form
    });


// jquery ajax deleteBuilding
    // xoa don
    function deleteBuilding(id) {
        var buildingId = [id]
         deleteBuildings(buildingId);
    }

    // xoa nhieu
    $('#btnDeleteBuildings').click(function(e){
        e.preventDefault();
        var data = {};
        var buildingIds = $('#tableList').find('tbody input[type="checkbox"]:checked').map(function(){
            return $(this).val();
        }).get();
        deleteBuildings(buildingIds)
    })

    // sd ajax send data ve server
    function deleteBuildings(data) {
        $.ajax({
            type: "DELETE",
            url: "${buildingAPI}/" + data,
            contentType: "application/json",// client gửi dữ liệu dưới dạng JSON
            data: JSON.stringify(data), // gui du lieu
            dataType: "JSON", // Định dạng dữ liệu trả ra
            success: function (response) {
                console.log("Thêm toà nhà thành công");
            },
            error: function (response) {
                console.log("Thêm toà nhà thất bại");
                console.log(response);
            }
        })
    }
</script>
</body>
</html>
