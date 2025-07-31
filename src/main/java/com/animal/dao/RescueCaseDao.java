package com.animal.dao;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.orm.hibernate5.HibernateTemplate;
import com.animal.model.RescueCase;

public class RescueCaseDao {

    private HibernateTemplate hibernateTemplate;

    // Setter for XML configuration
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    /** Add a new rescue case */
    @Transactional
    public int addCase(RescueCase rescueCase) {
        return (Integer) this.hibernateTemplate.save(rescueCase);
    }

    /** Get all rescue cases */
    @SuppressWarnings("unchecked")
    public List<RescueCase> getAllCases() {
        return (List<RescueCase>) this.hibernateTemplate.loadAll(RescueCase.class);
    }

    /** Get all rescue cases reported by a specific reporter */
    @SuppressWarnings("unchecked")
    public List<RescueCase> getCasesByReporter(String reporterContact) {
        return (List<RescueCase>) this.hibernateTemplate.findByNamedParam(
            "from RescueCase rc where rc.reporterContact = :contact",
            "contact",
            reporterContact
        );
    }

    /** Fetch a specific rescue case by its ID */
    public RescueCase getCaseById(int id) {
        return this.hibernateTemplate.get(RescueCase.class, id);
    }

    /** Update an existing rescue case */
    @Transactional
    public void updateCase(RescueCase rescueCase) {
        this.hibernateTemplate.update(rescueCase);
    }

    /** Update the status of a rescue case */
    @Transactional
    public void updateCaseStatus(int id, String status) {
        RescueCase rescueCase = this.hibernateTemplate.get(RescueCase.class, id);
        if (rescueCase != null) {
            rescueCase.setStatus(status);
            this.hibernateTemplate.update(rescueCase);
        }
    }

    /** Delete a rescue case by its ID */
    @Transactional
    public void deleteCase(int id) {
        RescueCase rc = this.hibernateTemplate.get(RescueCase.class, id);
        if (rc != null) {
            this.hibernateTemplate.delete(rc);
        }
    }
}
