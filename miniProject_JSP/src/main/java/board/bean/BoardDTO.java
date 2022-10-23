package board.bean;

import lombok.Getter;
import lombok.Setter;

@Setter@Getter
public class BoardDTO {
	int seq;
    String id;
    String name;
    String email;
    String subject;
    String content; 

    int ref;
    int lev;
    int step;
    int pseq;
    int reply;

    int hit;
    String logtime;
}
