package com.javaweb.controller.admin;

import com.javaweb.constant.SystemConstant;
import com.javaweb.enums.TransactionType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.service.IUserService;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller(value = "customerControllerOfAdmin")
public class CustomerController {
    @Autowired
    private IUserService iUserService;

    // hien thi
    @RequestMapping(value = "/admin/customer-list", method = RequestMethod.GET) // ket noi voi fe
    public ModelAndView getNews(@ModelAttribute(SystemConstant.MODEL) CustomerDTO model, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/customer/list"); // link vat ly
        mav.addObject("staffmaps", iUserService.getStaffs());
        List<CustomerDTO> list = new ArrayList<>();
        CustomerDTO customerDTO = new CustomerDTO();
        customerDTO.setId(2L);
        customerDTO.setName("Nguyen Van Manh");
        customerDTO.setCustomerPhone("0368333177");
        customerDTO.setEmail("vmanh22@gmai.com");
        customerDTO.setStatus("Đang xử lý");
        list.add(customerDTO);
        model.setListResult(list);
        DisplayTagUtils.of(request,model);
        mav.addObject("modelSearch", model);
        mav.addObject("customers", list);
        return mav;
    }

    // them moi
    @GetMapping(value = "/admin/customer-edit")
    public ModelAndView addCustomer(@ModelAttribute("customerEdit") CustomerDTO customerDTO){
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        mav.addObject("customerEdit", customerDTO);
        return mav;
    }

    @GetMapping(value="/admin/customer-edit-{id}")
    public ModelAndView addCustomer(@PathVariable("id") Long id){
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        // find customer by id
        CustomerDTO customerDTO = new CustomerDTO();
        customerDTO.setId(2L);
        customerDTO.setName("Nguyen Van Manh");
        customerDTO.setCustomerPhone("0368333177");
        customerDTO.setEmail("vmanh22@gmai.com");
        customerDTO.setStatus("Đang xử lý");
        mav.addObject("customerEdit", customerDTO);
        mav.addObject("transactionType", TransactionType.transactionType());
        // 2 cai ds loai giao dich de hien ra vd findByCodeAndCustomerId
        //listType1 voi code CSKH thi co 1 list ds lam nhung gi
        //listType2  voi code DDX thi lam nhung gi

        return mav;
    }
}
