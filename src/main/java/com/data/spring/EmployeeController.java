package com.data.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmployeeController {

    @Autowired
    EmployeeRepository er;

    @RequestMapping("/")
    public String showAll(Model model, Pageable pageable) {
        int pageSize = 5;
        int currentPage = pageable.getPageNumber();
        Page<Employee> page = er.findAll(PageRequest.of(currentPage, pageSize));
        model.addAttribute("page", page);
        return "index";
    }

    @GetMapping("/addEmployee")
    public String addEmployee(Model model) {
        model.addAttribute("employee", new Employee());
        return "addNew";
    }

    @PostMapping("/saveEmployee")
    public String saveEmployee(@ModelAttribute("employee") Employee employee) {
        er.save(employee);
        return "redirect:/";
    }

    @GetMapping("/updateEmployee/{id}")
    public String updateEmployee(@PathVariable(value = "id") int id, Model model) {
        Employee e = er.findById(id).orElseThrow();
        model.addAttribute("emp", e);
        return "updateJsp";
    }

    @GetMapping("/deleteEmployee/{id}")
    public String deleteEmployee(@PathVariable(value = "id") int id) {
        Employee emp = er.findById(id).orElseThrow();
        er.delete(emp);
        return "redirect:/";
    }
}