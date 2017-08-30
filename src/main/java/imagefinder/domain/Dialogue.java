package imagefinder.domain;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "Dialogue")
public class Dialogue {


    @Id
    @NotNull
    private String uid;
    private String simpleText;
    private String rawText;
    private String fileName;
    private String startTime;
    private String endTime;
    private Boolean hasImage;
    private Boolean assAdded;

    protected Dialogue() {
    }

    public Dialogue(Integer id, String uid, String simpleText, String rawText, String fileName, String startTime,
                    String endTime, Boolean hasImage, Boolean assAdded) {
        this.uid = uid;
        this.simpleText = simpleText;
        this.rawText = rawText;
        this.fileName = fileName;
        this.startTime = startTime;
        this.endTime = endTime;
        this.hasImage = hasImage;
        this.assAdded = assAdded;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getSimpleText() {
        return simpleText;
    }

    public void setSimpleText(String simpleText) {
        this.simpleText = simpleText;
    }

    public String getRawText() {
        return rawText;
    }

    public void setRawText(String rawText) {
        this.rawText = rawText;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public Boolean getHasImage() {
        return hasImage;
    }

    public void setHasImage(Boolean hasImage) {
        this.hasImage = hasImage;
    }

    public Boolean getAssAdded() {
        return assAdded;
    }

    public void setAssAdded(Boolean assAdded) {
        this.assAdded = assAdded;
    }
}
