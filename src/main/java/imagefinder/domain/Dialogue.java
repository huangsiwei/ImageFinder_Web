package imagefinder.domain;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "Dialogue")
public class Dialogue {

    @Id
    @NotNull
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @NotNull
    private String uuid;
    private String simpleText;
    private String rawText;
    private String fileName;
    private String startTime;
    private String endTime;

    protected Dialogue() {
    }

    public Dialogue(Integer id, String uuid, String simpleText, String rawText, String fileName, String startTime, String endTime) {
        this.id = id;
        this.uuid = uuid;
        this.simpleText = simpleText;
        this.rawText = rawText;
        this.fileName = fileName;
        this.startTime = startTime;
        this.endTime = endTime;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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


    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
}
