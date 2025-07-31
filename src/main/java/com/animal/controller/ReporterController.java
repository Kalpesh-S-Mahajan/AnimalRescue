package com.animal.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.animal.dao.ReporterDao;
import com.animal.model.Reporter;

@Controller
public class ReporterController {

    private final ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
    private final ReporterDao reporterDao = context.getBean("reporterDao", ReporterDao.class);

    @RequestMapping("/reporter-login-register")
    public String reporlogin() {
        return "reporter-login-register";
    }

    @RequestMapping(path = "/registerReporter", method = RequestMethod.POST)
    public String registerReporter(HttpServletRequest request, Model model) {
        Reporter reporter = new Reporter(); // NEW object for each registration
        reporter.setContact(request.getParameter("contact"));
        reporter.setName(request.getParameter("name"));
        reporter.setAddress(request.getParameter("address"));
        reporter.setEmail(request.getParameter("email"));
        reporter.setPassword(request.getParameter("password"));

        String savedContact = reporterDao.addReporter(reporter);
        if (savedContact != null && !savedContact.isEmpty()) {
            model.addAttribute("msg", "Reporter registered successfully!");
            return "reporter-login-register";
        } else {
            model.addAttribute("error", "Failed to register reporter!");
            return "reporter-login-register";
        }
    }

    @RequestMapping(path = "/loginReporter", method = RequestMethod.POST)
    public String loginReporter(HttpServletRequest request, HttpSession session, Model model) {
        String contact = request.getParameter("contact");
        
        String password = request.getParameter("password");

        Reporter r = reporterDao.findByContact(contact);

        if (r != null && r.getPassword().equals(password)) {
            session.setAttribute("reporter", r);
            model.addAttribute("msg", "Welcome, " + r.getName() + "!");
            return "reporter-dashboard";
        } else {
            model.addAttribute("error", "Invalid contact or password!");
            return "reporter-login-register";
        }
    }
 
    @RequestMapping("/reporter-dashboard")
    public String reporterDashboard() {
        return "reporter-dashboard";
    }
    
    @RequestMapping("/logoutReporter")
    public String logoutReporter(HttpSession session) {
        session.invalidate();
        return "redirect:/reporter-login-register";
    }
}
