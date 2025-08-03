         case 10001:
             global.choicemsg[0] = "#I do";
             global.choicemsg[1] = "#I don't";
             global.choicemsg[2] = "";
             global.choicemsg[3] = "";
             scr_speaker("no_name");
             msgset(0, "\\C2 ");
             break;
         
         case 10002:
             with (obj_ch4_PDC14A_noelle)
                 con = 4;
             
             scr_speaker("no_name");
             msgset(0, "%%");
