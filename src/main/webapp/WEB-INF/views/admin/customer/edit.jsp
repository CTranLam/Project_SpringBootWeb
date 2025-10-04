<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerEditURL" value="/admin/customer-edit"/>
<c:url var="customerAPI" value="/api/customer"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chỉnh sủa thông tin</title>
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
                <c:if test="${not empty customerEdit.id}">
                    <li class="active">Edit customer</li>
                </c:if>
                <c:if test="${empty customerEdit.id}">
                    <li class="active">Add customer</li>
                </c:if>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    Thông tin khách hàng
                </h1>
            </div>
        </div>
        <div class="row">
            <form:form modelAttribute="customerEdit" action="${customerEditURL}" id="listForm" method="GET">
                <div class="col-xs-12">
                    <form class="form-horizontal" role="form" id="form-edit">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no no-padding-right" for="name">Tên khách hàng</label>
                            <div class="col-sm-9 mb-3">
                                <form:input path="name" id="name" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no no-padding-right" for="customerPhone">Số điện
                                thoại</label>
                            <div class="col-sm-9 mb-3">
                                <form:input path="customerPhone" id="customerPhone" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no no-padding-right" for="email">Email</label>
                            <div class="col-sm-9 mb-3">
                                <form:input path="email" id="email" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no no-padding-right" for="companyName">Tên công
                                ty</label>
                            <div class="col-sm-9 mb-3">
                                <form:input path="companyName" id="companyName" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no no-padding-right" for="demand">Nhu cầu</label>
                            <div class="col-sm-9 mb-3">
                                <form:input path="demand" id="demand" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no no-padding-right" for="status">Trạng thái</label>
                            <div class="col-sm-9 mb-3">
                                <form:input path="status" id="status" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"></label>
                            <div class="col-sm-9">
                                <c:if test="${not empty customerEdit.id}">
                                    <input type="button" class="btn btn-primary" value="Cập nhật thông tin"
                                           id="btnAddOrUpdateCustomer"/>
                                    <input type="button" class="btn btn-danger" value="Huỷ" id="cancelBtn"/>
                                </c:if>
                                <c:if test="${empty customerEdit.id}">
                                    <input type="button" class="btn btn-primary" value="Thêm khách hàng"
                                           id="btnAddOrUpdateCustomer"/>
                                    <input type="button" class="btn btn-danger" value="Huỷ" id="cancelBtn"/>
                                </c:if>
                            </div>
                        </div>
                    </form>
                </div>
            </form:form>
        </div>
    </div>
    <c:forEach var="item" items="${transactionType}">
        <div class="col-xs-12">
            <div class="col-sm-12">
                <h3 class="header smaller lighter blue">${item.value}</h3>
                <button class="btn btn-lb btn-primary" onclick="transactionType('${item.key}', ${customerEdit.id})">
                    <i class="orange ace-icon fa fa-location-arrow"></i>Add
                </button>
            </div>
            <c:if test="${item.key == 'DDX'}">
                <div class="col-xs-12">
                    <table id="simple-table" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>Ngày tạo</th>
                            <th>Người tạo</th>
                            <th>Ngày sửa</th>
                            <th>Người sửa</th>
                            <th>Chi tiết giao dịch</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                            <%--                        <tbody>--%>
                            <%--                        <!-- Bạn có thể duyệt dữ liệu chi tiết ở đây -->--%>
                            <%--                        <c:forEach var="txn" items="${customerTransactions}">--%>
                            <%--                            <tr>--%>
                            <%--                                <td>${txn.createdDate}</td>--%>
                            <%--                                <td>${txn.createdBy}</td>--%>
                            <%--                                <td>${txn.detail}</td>--%>
                            <%--                                <td>--%>
                            <%--                                    <!-- nút chỉnh sửa -->--%>
                            <%--                                    <button class="btn btn-xs btn-warning" data-toggle="tooltip" title="sửa thông tin giao dịch"--%>
                            <%--                                            onclick="updateTransaction('${txn.id}')">--%>
                            <%--                                        <i class="fa fa-pencil"></i> Chỉnh sửa--%>
                            <%--                                    </button>--%>
                            <%--                                </td>--%>
                            <%--                            </tr>--%>
                            <%--                        </c:forEach>--%>
                        <tbody>
                        <tr>
                            <td>04/10/2025</td>
                            <td>Nguyễn Văn A</td>
                            <td>27/10/2025</td>
                            <td>Nguyễn Văn D</td>
                            <td>Gọi điện thoại và tư vấn</td>
                            <td>
                                <!-- nút chỉnh sửa -->
                                <button class="btn btn-xs btn-warning" data-toggle="tooltip"
                                        title="sửa thông tin giao dịch"
                                        onclick="updateTransaction(1,'DDX',2)">
                                    <i class="fa fa-pencil"></i> Chỉnh sửa
                                </button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </c:if>
            <c:if test="${item.key == 'CSKH'}">
                <div class="col-xs-12">
                    <table id="simple-table" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>Ngày tạo</th>
                            <th>Người tạo</th>
                            <th>Ngày sửa</th>
                            <th>Người sửa</th>
                            <th>Chi tiết giao dịch</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>04/10/2025</td>
                            <td>Nguyễn Văn A</td>
                            <td>24/10/2025</td>
                            <td>Nguyễn Văn C</td>
                            <td>Dẫn khách hàng đi xem</td>
                            <td>
                                <button class="btn btn-xs btn-warning" data-toggle="tooltip"
                                        title="sửa thông tin giao dịch"
                                        onclick="updateTransaction(1,'CSKH',2)">
                                    <i class="fa fa-pencil"></i> Chỉnh sửa
                                </button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
    </c:forEach>
    <div class="modal fade" id="transactionTypeModal" role="dialog">
        <div class="modal-dialog">
            <%--    model content--%>
            <div class="modal-content">
                <div class="modal-header">
                    <button type="submit" class="close" data-dismiss="modal"></button>
                    <h4 class="modal-title">Nhập giao dịch</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="transactionDetail" class="col-xs-12 col-sm-3 control-label no-padding-right">Chi
                            tiết giao dịch</label>
                        <div class="col-sm-9">
                            <input type="text" id="transactionDetail" class="form-control"/>
                        </div>
                    </div>
                    <input type="hidden" name="customerId" id="customerId" value="">
                    <input type="hidden" name="code" id = "code" value="">
                    <input type="hidden" name="id" id = "id" value="">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="btnAddOrUpdateTransaction">Thêm giao dịch</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    // them moi
    function transactionType(code, customerId) {
        $('#transactionTypeModal').modal();
        $('#customerId').val(customerId); // gan gia tri bien hidden
        $('#code').val(code);
    }

    // update
    function updateTransaction(id, code, customerId) {
        $('#transactionTypeModal').modal();
        $('#id').val(id); // update thi cap nhat value cho bien hidden ID
        $('#code').val(code);
        $('#customerId').val(customerId);
    }

    // them moi va sua sd chung 1 ajax de gui, them moi khong co ID
    $('#btnAddOrUpdateTransaction').click(function (e) {
        e.preventDefault();
        var data = {}; // match voi ten thuoc tinh trong DTO
        data['id'] = $('#id').val();
        data['customerId'] = $('#customerId').val();
        data['code'] = $('#code').val();
        data['transactionDetail'] = $('#transactionDetail').val();
        addOrUpdateTransaction(data);
    });

    function addOrUpdateTransaction(data) {
        $.ajax({
            type: "POST",
            url: '${customerAPI}/transaction',
            data: JSON.stringify(data),
            // dataType
            contentType: "application/json",
            success: function () {
                console.log("success");
                alert("Add Transaction Success");
            },
            error: function () {
                console.log("faild");
                window.location.href = "<c:url value = "/admin/user-edit?message=error"/>"
            }
        });
    }

    $('#btnAddOrUpdateCustomer').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#listForm').serializeArray();
        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        });
        updateAndCreateCustomer(data);
    })

    function updateAndCreateCustomer(data) {
        $.ajax({
            url: '${customerAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function () {
                window.location.href = "<c:url value = '/admin/customer-list?message=success'/>";
                console.log("success");
            },
            error: function () {
                window.location.href = "<c:url value = '/admin/customer-edit?message=error_system'/>";
            }
        });
    }
    $('#cancelBtn').click(function (){
        window.location.href="/admin/customer-list";
    })
</script>
</body>
</html>
