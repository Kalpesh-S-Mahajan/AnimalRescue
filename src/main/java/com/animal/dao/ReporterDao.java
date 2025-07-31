package com.animal.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.orm.hibernate5.HibernateTemplate;

import com.animal.model.Reporter;

public class ReporterDao {

    private HibernateTemplate hibernateTemplate;

    // Setter for XML configuration
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }
    @Transactional
    public String addReporter(Reporter reporter) {
        return (String) this.hibernateTemplate.save(reporter);
    }

    public Reporter findByContact(String contact) {
        return this.hibernateTemplate.get(Reporter.class, contact);
    }

    @SuppressWarnings("unchecked")
    public List<Reporter> getAllReporters() {
        return (List<Reporter>) this.hibernateTemplate.loadAll(Reporter.class);
    }

    public void deleteReporter(String contact) {
        Reporter r = this.hibernateTemplate.get(Reporter.class, contact);
        if (r != null) {
            this.hibernateTemplate.delete(r);
        }
    }

    public void updateReporter(Reporter reporter) {
        this.hibernateTemplate.update(reporter);
    }
}
