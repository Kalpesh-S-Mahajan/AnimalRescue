package com.animal.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.animal.dao.RescueCaseDao;
import com.animal.model.Reporter;
import com.animal.model.RescueCase;

@Controller
public class RescueCaseController {

    ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
    RescueCaseDao rescueCaseDao = context.getBean("rescueCaseDao", RescueCaseDao.class);

    // Show the Add Rescue Case form
    @RequestMapping("/reporter-addRescueCase")
    public String addRescueCasePage() {
        return "reporter-addRescueCase";
    }

    // Save a new rescue case
    @RequestMapping(path = "/saveRescueCase", method = RequestMethod.POST)
    public String saveRescueCase(HttpServletRequest request, HttpSession session, Model model) {
        Reporter reporter = (Reporter) session.getAttribute("reporter");

        if (reporter == null) {
            model.addAttribute("error", "You must login first!");
            return "reporter-login-register";
        }

        RescueCase rescueCase = new RescueCase();
        rescueCase.setReporterContact(reporter.getContact());
        rescueCase.setAnimalType(request.getParameter("animalType"));
        rescueCase.setLocation(request.getParameter("location"));
        rescueCase.setDescription(request.getParameter("description"));
        rescueCase.setReportDate(request.getParameter("reportDate")); 
        rescueCase.setStatus("Pending");

        rescueCaseDao.addCase(rescueCase);
        model.addAttribute("msg", "Rescue case saved successfully!");
        return "reporter-dashboard";
    }

    // View all rescue cases for the logged-in reporter
    @RequestMapping("/reporter-viewRescueCases")
    public String viewRescueCases(HttpSession session, Model model) {
        Reporter reporter = (Reporter) session.getAttribute("reporter");
        if (reporter == null) {
            model.addAttribute("error", "You must login first!");
            return "reporter-login-register";
        }

        List<RescueCase> cases = rescueCaseDao.getCasesByReporter(reporter.getContact());
        model.addAttribute("cases", cases);
        return "reporter-viewRescueCases";
    }

    // Check the status of a specific case
    @RequestMapping(path = "/reporter-caseStatus", method = RequestMethod.GET)
    public String caseStatus(HttpServletRequest request, Model model) {
        String caseIdParam = request.getParameter("caseId");
        if (caseIdParam != null && !caseIdParam.trim().isEmpty()) {
            int caseId = Integer.parseInt(caseIdParam);
            RescueCase rescueCase = rescueCaseDao.getCaseById(caseId);
            if (rescueCase != null) {
                model.addAttribute("case", rescueCase);
            } else {
                model.addAttribute("error", "No case found with ID: " + caseId);
            }
        }
        return "reporter-caseStatus";
    }
}
