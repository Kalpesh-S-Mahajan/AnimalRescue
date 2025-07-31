package com.animal.dao;

import java.io.Serializable;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.orm.hibernate5.HibernateTemplate;
import com.animal.model.Volunteer;

public class VolunteerDao {

    private HibernateTemplate hibernateTemplate;

    // Getter & Setter
    public HibernateTemplate getHibernateTemplate() {
        return hibernateTemplate;
    }

    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    // Add Volunteer
    @Transactional
    public String addVolunteer(Volunteer volunteer) {
        Serializable id = this.hibernateTemplate.save(volunteer);
        return id.toString();  
    }

    // View All Volunteers
    public List<Volunteer> viewAllVolunteers() {
        return hibernateTemplate.loadAll(Volunteer.class);
    }

    // Delete Volunteer by Contact
    @Transactional
    public void deleteVolunteer(String contact) {
        Volunteer volunteer = this.hibernateTemplate.get(Volunteer.class, contact);
        if (volunteer != null) {
            this.hibernateTemplate.delete(volunteer);
        }
    }

    public Volunteer validateLogin(String contact, String password) {
        List<Volunteer> volunteers = (List<Volunteer>) hibernateTemplate.findByNamedParam(
            "from Volunteer where contact = :contact and password = :password",
            new String[]{"contact", "password"},
            new Object[]{contact, password}
        );
        return volunteers.isEmpty() ? null : volunteers.get(0);
    }

}
