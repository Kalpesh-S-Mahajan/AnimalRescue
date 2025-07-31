package com.animal.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.animal.dao.RescueCaseDao;
import com.animal.dao.VolunteerDao;
import com.animal.model.RescueCase;
import com.animal.model.Volunteer;

@Controller
public class VolunteerController {

    // Single ApplicationContext instance (avoid creating multiple times)
    private final ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
    private final VolunteerDao volunteerDao = (VolunteerDao) context.getBean("volunteerDao");
    private final RescueCaseDao rescueCaseDao = (RescueCaseDao) context.getBean("rescueCaseDao");

    // Volunteer Login Page
    @RequestMapping("/volunteer-login")
    public String volunteerLoginPage() {
        return "volunteer-login";
    }

    // Volunteer Login Validation
    @PostMapping("/volunteer-login-submit")
    public String loginVolunteer(HttpServletRequest request) {
        String contact = request.getParameter("contact");
        String password = request.getParameter("password");

        Volunteer volunteer = volunteerDao.validateLogin(contact, password);
        if (volunteer != null) {
            HttpSession session = request.getSession();
            session.setAttribute("volunteer", volunteer);
            return "volunteer-dashboard";
        } else {
            request.setAttribute("error", "Invalid contact or password");
            return "volunteer-login";
        }
    }

    // View All Volunteers
    @RequestMapping("/view-volunteers")
    public String viewVolunteers(HttpServletRequest request) {
        List<Volunteer> volunteers = volunteerDao.viewAllVolunteers();
        request.setAttribute("volunteers", volunteers);
        return "volunteer-list";
    }

    // Add Volunteer
    @PostMapping("/add-volunteer")
    public String addVolunteer(HttpServletRequest request) {
        String contact = request.getParameter("contact");
        String name = request.getParameter("name");
        String zone = request.getParameter("zone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Volunteer volunteer = new Volunteer(contact, name, zone, email, password);
        volunteerDao.addVolunteer(volunteer);

        return "redirect:/view-volunteers";
    }

    // Delete Volunteer
    @RequestMapping("/delete-volunteer")
    public String deleteVolunteer(HttpServletRequest request) {
        String contact = request.getParameter("contact");
        volunteerDao.deleteVolunteer(contact);
        return "redirect:/view-volunteers";
    }

    // Logout
    @RequestMapping("/volunteer-logout")
    public String volunteerLogout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/volunteer-login";
    }

    /* -------------------- Rescue Cases Management -------------------- */

    // View all rescue cases
    @RequestMapping("/view-rescue-cases")
    public String viewRescueCases(HttpServletRequest request) {
        List<RescueCase> rescueCases = rescueCaseDao.getAllCases();
        request.setAttribute("rescueCases", rescueCases);
        return "view-rescue-cases";
    }

    // Page for updating status
    @RequestMapping("/update-rescue-status")
    public String updateRescueStatus(HttpServletRequest request) {
        List<RescueCase> rescueCases = rescueCaseDao.getAllCases();
        request.setAttribute("rescueCases", rescueCases);
        return "update-rescue-status";
    }

    // Mark a rescue as completed
    @PostMapping("/mark-rescue-completed")
    public String markRescueCompleted(HttpServletRequest request) {
        int caseId = Integer.parseInt(request.getParameter("caseId"));
        rescueCaseDao.updateCaseStatus(caseId, "RescueCompleted");
        return "redirect:/update-rescue-status";
    }
    
 // Volunteer Dashboard Mapping
    @RequestMapping("/volunteer-dashboard")
    public String volunteerDashboard() {
        return "volunteer-dashboard";
    }

}
