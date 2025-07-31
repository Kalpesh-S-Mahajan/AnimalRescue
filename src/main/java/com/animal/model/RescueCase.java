package com.animal.model;

import javax.persistence.*;

@Entity
@Table(name = "rescue_cases")
public class RescueCase {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "reporter_contact", nullable = false, length = 15)
    private String reporterContact;

    @Column(name = "animalType", nullable = false, length = 100)
    private String animalType;

    @Column(name = "location", nullable = false, length = 200)
    private String location;

    @Column(name = "description")
    private String description;

    @Column(name = "reportDate", nullable = false)
    private String reportDate;  // Keep date as String

    @Column(name = "status", length = 50)
    private String status;

    public RescueCase() {
        this.status = "Pending";
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getReporterContact() { return reporterContact; }
    public void setReporterContact(String reporterContact) { this.reporterContact = reporterContact; }

    public String getAnimalType() { return animalType; }
    public void setAnimalType(String animalType) { this.animalType = animalType; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getReportDate() { return reportDate; }
    public void setReportDate(String reportDate) { this.reportDate = reportDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
