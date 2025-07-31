package com.animal.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.animal.dao.VolunteerDao;
import com.animal.dao.ReporterDao;
import com.animal.dao.RescueCaseDao;
import com.animal.model.Volunteer;
import com.animal.model.Reporter;
import com.animal.model.RescueCase;

@Controller
public class AdminController {

    ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
    Volunteer volunteer = context.getBean("volunteer", Volunteer.class);
    VolunteerDao volunteerDao = context.getBean("volunteerDao", VolunteerDao.class);

    // Default mappings
    @RequestMapping("/")
    public String dashboard() {
        return "index";
    }

    @RequestMapping("/index")
    public String dashboard2() {
        return "index";
    }

    @RequestMapping("/admin-login")
    public String admilogin() {
        return "admin-login";
    }

    @RequestMapping(path = "/submitlogin", method = RequestMethod.POST)
    public String adminlogin(HttpServletRequest request) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email.equals("admin@gmail.com") && password.equals("admin")) {
            System.out.println("Successfully logged in ........");
            return "admin-dashboard";
        } else {
            return "index";
        }
    }

    @RequestMapping("/admin-manage")
    public String adminmanage() {
        return "admin-manage";
    }

    // Updated: Load all rescue cases
    @RequestMapping("/admin-viewrescue")
    public String adminviewrescue(HttpServletRequest request) {
        RescueCaseDao rescueDao = context.getBean("rescueCaseDao", RescueCaseDao.class);
        List<RescueCase> cases = rescueDao.getAllCases();
        request.setAttribute("cases", cases);
        System.out.println("Rescue cases fetched: " + (cases != null ? cases.size() : 0));
        return "admin-viewrescue";
    }

    // Updated: Load all reporters
    @RequestMapping("/admin-viewreporter")
    public String adminviewreporter(HttpServletRequest request) {
        ReporterDao reporterDao = context.getBean("reporterDao", ReporterDao.class);
        List<Reporter> reporters = reporterDao.getAllReporters();
        request.setAttribute("reporters", reporters);
        System.out.println("Reporters fetched: " + (reporters != null ? reporters.size() : 0));
        return "admin-viewreporter";
    }

    @RequestMapping("/admin-addVolunteer")
    public String addvolunteer() {
        return "admin-addVolunteer";
    }

    // Register Volunteer
    @RequestMapping(path = "/registervolunteer", method = RequestMethod.POST)
    public String Add(HttpServletRequest request) {
        volunteer.setContact(request.getParameter("contact"));
        volunteer.setName(request.getParameter("name"));
        volunteer.setZone(request.getParameter("zone"));
        volunteer.setEmail(request.getParameter("email"));
        volunteer.setPassword(request.getParameter("password"));

        String savedContact = volunteerDao.addVolunteer(volunteer);
        System.out.println("Volunteer Contact (Primary Key): " + savedContact);

        if (savedContact != null && !savedContact.isEmpty()) {
            System.out.println("Volunteer inserted successfully");
            return "admin-addVolunteer";
        } else {
            System.err.println("Volunteer insertion failed");
            return "admin-manage";
        }
    }

    // View All Volunteers
    @RequestMapping("/admin-viewVolunteer")
    public String viewVolunteer(Model model) {
        List<Volunteer> allVolunteers = volunteerDao.viewAllVolunteers();
        model.addAttribute("volunteers", allVolunteers);
        return "admin-viewVolunteer";
    }

    // Delete Volunteer by Contact
    @RequestMapping(path = "/deleteVolunteer", method = RequestMethod.GET)
    public String deleteVolunteer(HttpServletRequest request) {
        String contact = request.getParameter("contact");
        System.out.println("Deleting volunteer with contact: " + contact);
        volunteerDao.deleteVolunteer(contact);
        return "redirect:/admin-viewVolunteer";
    }

    // Admin Dashboard
    @RequestMapping("/admin-dashboard")
    public String admindashboard() {
        return "admin-dashboard";
    }
}
