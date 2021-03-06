/* Based on fa1.pml  Copyright 2007 by Moti Ben-Ari under the GNU GPL */

#define LEN 5


inline Input(n) {
  if
  :: i[n] = 'a'
  :: i[n] = 'b'
  :: i[n] = 'c'
  :: i[n] = 'd'
  fi
}

inline len_seq() {
  if
  :: j = 1;
  :: j = 2;
  :: j = 3;
  :: j = 4;
  :: j = 5;
  fi
}
//this will generate  around 58 trail files in which first 30 files will contain the same output
active proctype FA() {
byte h;
int j;
len_seq(); 
byte i[j];  
Input(0); Input(1); Input(2); Input(3);
i[j-1] = '.' ;
q0: if
    :: i[h] == 'a'  -> printf("@TRANS q0 a q1\n"); h++; goto q1;
    :: i[h] == 'a'  -> printf("@TRANS q0 a q2\n"); h++; goto q2;
    :: i[h] == 'b'  -> printf("@TRANS q0 b q3\n"); h++; goto q3;
    fi;
q1: if
    :: i[h] == 'd'  -> printf("@TRANS q1 d q3\n"); h++; goto q3;
    fi;
q2: if
    :: i[h] == 'b'  -> printf("@TRANS q2 b q4\n"); h++; goto q4;
    fi;
q3: if
    :: i[h] == 'c'  -> printf("@TRANS q3 c q2\n"); h++; goto q2;
    :: i[h] == 'c'  -> printf("@TRANS q3 c q6\n"); h++; goto q6;
    :: i[h] == 'd'  -> printf("@TRANS q3 d q5\n"); h++; goto q5;
    :: i[h] == '.'  -> printf("@TRANS q3 . accept\n"); goto accept;
    fi;
q4: if
    :: i[h] == 'a'  -> printf("@TRANS q4 a q2\n"); h++; goto q2;
    :: i[h] == 'c'  -> printf("@TRANS q4 c q6\n"); h++; goto q6;
    :: i[h] == 'b'  -> printf("@TRANS q4 b q5\n"); h++; goto q5;
    fi;
q5: if
    :: i[h] == 'a'  -> printf("@TRANS q5 a q4\n"); h++; goto q4;
    :: i[h] == 'b'  -> printf("@TRANS q5 b q1\n"); h++; goto q1;

    fi;
q6: if
    :: i[h] == '.'  -> printf("@TRANS q6 . accept\n"); goto accept;
    fi;

accept:
    printf("Accepted!\n"); 
    assert(false)

}
active proctype Watchdog() {
end:	timeout -> printf("Rejected ...\n")
}