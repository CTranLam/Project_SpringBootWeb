<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh sách khách hàng</title>
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
                        <div class="widget-body">
                            <div class="widget-main">
                                <form:form id="listForm" action="/admin/customer-list" modelAttribute="modelSearch"
                                           method="GET">
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="col-sm-4">
                                                <div>
                                                    <label for="name">Tên khách hàng</label>
                                                    <form:input path="name" cssClass="form-control"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div>
                                                    <label class="label-search">Di động</label>
                                                    <form:input path="customerPhone" cssClass="form-control"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div>
                                                    <label class="label-search">Email</label>
                                                    <form:input path="email" cssClass="form-control"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="col-sm-4">
                                                <div>
                                                    <label class="name">Chọn nhân viên</label>
                                                    <form:select class="form-control" path="staffId">
                                                        <form:option value="">---Chọn nhân viên---</form:option>
                                                        <form:options items="${staffmaps}"/>

                                                    </form:select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="col-sm-4">
                                                <button type="submit" class="btn btn-xs btn-danger" id="btnSearch">
                                                    Tìm kiếm
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    </form:form>
                                </div>
                            </div>
                            <div class="pull-right">
                                <a href="/admin/customer-edit" class="btn btn-info" title="Thêm khách hàng">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-person-fill-add" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                                        <path d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4"/>
                                    </svg>
                                </a>
                                <button class="btn btn-danger" title="Xoá khách hàng" id="btnDeleteCustomer">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-person-fill-dash" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1m0-7a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                                        <path d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4"/>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12" style="font-family: 'Times New Roman', Times, serif;">
                    <table id="tableList" style="margin: 3em 0 1.5em;"
                           class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace" name="checkList" value="">
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            <th>Tên khách hàng</th>
                            <th>Di động</th>
                            <th>Email</th>
                            <th>Nhu cầu</th>
                            <th>Tình trạng</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="item" items="${customers}">
                            <tr>
                                <td class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" name="checkList" value= ${item.id}>
                                        <span class="lbl"></span>
                                    </label>
                                </td>

                                <td>${item.name}</td>
                                <td>${item.customerPhone}</td>
                                <td>${item.email}</td>
                                <td>${item.demand}</td>
                                <td>${item.status}</td>

                                <td>
                                    <div class="hidden-sm hidden-xs btn-group">
                                            <%--                                        <security:authorize access="hasRole('MANAGER')">--%>
                                        <button class="btn btn-xs btn-success" title="Giao khách hàng"
                                                onclick="assigmentCustomer(${item.id})">
                                            <i class="ace-icon glyphicon glyphicon-list"></i>
                                        </button>
                                            <%--                                        </security:authorize>--%>


                                        <a href="/admin/customer-edit-${item.id}" class="btn btn-xs btn-info"
                                           title="Sửa khách hàng">
                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                        </a>
                                            <%--                                        <security:authorize access="hasRole('MANAGER')">--%>
                                        <button class="btn btn-xs btn-danger" title="Xoá khách hàng"
                                                onclick="deleteCustomer(${item.id})">
                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                        </button>
                                            <%--                                        </security:authorize>--%>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div><!-- /.span -->
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="assigmentCustomerModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Danh sách nhân viên</h4>
            </div>

            <div class="modal-body">
                <table class="table table-striped table-bordered table-hover" id="staffList">
                    <thead>
                    <tr>
                        <th class="center">Chọn</th>
                        <th>Tên nhân viên</th>
                    </tr>
                    </thead>

                    <tbody>
                    </tbody>
                </table>
                <input type="hidden" id="id" name="id" value="">
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnassignmentCustomer">Giao nhân viên</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>
<script>
    function assigmentCustomer(customerId) {
        $('#assigmentCustomerModal').modal();
    }

</script>
</body>
</html>
