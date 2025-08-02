if (con == 1)
{
    /*
    i stood up and saw. saw through the outlines.
    saw the reflections bouncing in, around, back out.
    the twilight, marred, scarred.

    on a more serious note: dev commentary i guess
    i was listening to one of Andrew Cunningham's ELEKTIONTRÜCKUNG streams to fall asleep, and this scene came to me in a half-dream.
    i got up, but it didn't leave my head as it was supposed to.
    i couldn't stop thinking about it, so i forcefully evicted it onto this canvas.
    
    the cutscene system is cool so this was fun.
    */
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.interact = 1;
    
    no = ++actor_count;
    no_actor = instance_create(noelle_npc.x, noelle_npc.y, obj_actor);
    scr_actor_setup(no, no_actor, "noelle");
    no_actor.sprite_index = noelle_npc.sprite_index;
    
    hrt = ++actor_count;
    hrt_actor = instance_create(200, 115, obj_actor);
    scr_actor_setup(hrt, hrt_actor, "heart");
    hrt_actor.sprite_index = spr_heart;
    hrt_actor.depth = no_actor.depth - 1;
    hrt_actor.image_xscale = 0.4;
    hrt_actor.image_yscale = 0.4;

    // hand1 = ++actor_count;
    // hand1_actor = instance_create(197, 110, obj_actor);
    // scr_actor_setup(hand1, hand1_actor, "hand1");
    // hand1_actor.image_angle = 180;
    
    // hand2 = ++actor_count;
    // hand2_actor = instance_create(193, 110, obj_actor);
    // scr_actor_setup(hand2, hand1_actor, "hand2");
    // hand2_actor.image_angle = 180;
    
    var wind_sfx = snd_init("wind_highplace.ogg");
    c_mus("free"); // free_all unloads this sfx since the command is queued for later
    c_mus2("loopsfx", wind_sfx, 0);
    c_mus2("loopsfxpitch", 0, 0);
    c_mus2("loopsfxpitchtime", 0.7, 1);
    c_mus2("loopsfxvolume", 0, 0);
    c_mus2("loopsfxvolume", 0.4, 30);
    c_sel(kr);
    c_autowalk(0);
    c_setxy(kris_marker.x, kris_marker.y);
    c_sprite(spr_kris_sit);
    c_flip("x"); // start out facing away from noelle

    c_var_instance(noelle_npc, "visible", 0);
    c_var_instance(kris_marker, "visible", 0);
    
    c_sel(hrt);
    c_autowalk(0);
    c_sprite(spr_heart);
    c_autodepth(false);
    c_depth(no_actor.depth - 1);
    c_visible(false);
    
    // c_sel(hand1);
    // c_sprite(spr_noelle_sit_chuckle_arm);
    // c_imageindex(0);
    // c_autodepth(false);
    // c_visible(false);

    // c_sel(hand2);
    // c_sprite(spr_noelle_sit_chuckle_arm);
    // c_imageindex(1);
    // c_autodepth(false);
    // c_flip("x");
    // c_visible(false);
    
    c_sel(no);
    c_autowalk(0);
    c_sprite(spr_noelle_sit_look_down_neutral);

    c_fadeout(5);
    c_wait(5);
    c_fadein(30);
    c_wait(30);
    
    noe_spr_offset_x = 5; // some noe sprites have weird x-offsets
    noe_spr_offset2_y = -1; // and some others have a y-offset...
    c_sprite(spr_noelle_sit_neutral);
    c_wait(65);
    c_sprite(spr_noelle_sit_expressions);
    c_imageindex(1);
    c_addxy(noe_spr_offset_x, 0);
    c_wait(45);
    
    c_sel(no);
    c_sprite(spr_noelle_sit_look_down_unhappy);
    c_addxy(-noe_spr_offset_x, 0);
    c_addxy(0, -noe_spr_offset2_y);
    c_imageindex(0);
    
    c_mus2("initloop", "noelle_distant.ogg", 0);
    c_mus2("volume", 0.3, 0);
    c_mus2("volume", 0.8, 60);
    c_wait(60);

    c_speaker("noelle");
    c_msgside("bottom");
    c_msgset(0, "\\EA* .../");
    c_msgnext("\\E9* It feels so much smaller now./%");
    c_talk_wait();
    
    c_wait(45);
    c_sel(no);
    c_sprite(spr_noelle_sit_closed_eyes_side_b);
    c_addxy(0, noe_spr_offset2_y);
    
    c_msgset(0, "\\Eb* Kris..^3. Hey^1, Kris?/");
    c_msgnext("\\Ea* (It was just like this...)/");
    c_msgnext("\\Ec* That time^1, on the ferris wheel.../");
    c_msgnext("\\Eb* Do you..^2. remember?/%");
    c_talk();
    // c_wait_box(2);
    c_waittalk();
    con = 2;
    c_waitcustom();
}
if (con == 2 && customcon == 1)
{
    customcon = 0;
    c_waitcustom_end();
    // i hate that this requires editing scr_text
    // but i found no other easy way to sequence in a choicer that actually worked
    c_msc(10001);
    c_talk_wait();
}

if (con == 4)
{
    customcon = 0;
    c_waitcustom_end();
    
    c_sel(no);
    c_sprite(spr_noelle_sit_look_down_left);

    c_speaker("noelle");
    c_msgset(0, "\\E8* Fahaha^1, you don't sound so sure!/");
    c_msgnext("\\E9* (But^1, they also sounded kind of..^3. sincere?)/%");
    c_talk_wait();

    c_wait(10);
    c_sel(no);
    c_sprite(spr_noelle_sit_closed_eyes_side_b);
    c_wait(25);
    
    c_msgset(0, "\\Ed* To tell you the truth^1, I.../");
    c_msgnext("\\Ee* Also don't remember much./");
    c_msgnext("\\Em* All I remember is..^2. shaking.../");
    c_msgnext("\\En* That awful^2, awful creaking.../");
    c_msgnext("\\Ee* And..^2. afterwards^1, on the ground,/");
    c_msgnext("\\Ed* Dad picking me up and carrying me away./%");
    c_talk();
    c_wait_box(2);
    c_sprite(spr_noelle_sit_look_down_eyes_closed);
    c_addxy(0, -noe_spr_offset2_y);
    c_wait_talk();
    
    c_wait(15);
    c_sel(no);
    c_sprite(spr_noelle_sit_look_down_unhappy);
    c_wait(50);
    
    c_speaker("noelle");
    c_msgset(0, "\\Eb* I guess there's..^3. one more thing./%");
    // c_msgnext("\\Ec* One thing I^1, for some reason^1, still remember./%");
    c_talk_wait();

    c_wait(25);

    c_speaker("noelle");
    c_msgset(0, "\\Eb* I remember looking back at you from behind Dad's shoulder.../");
    c_msgnext("\\Ea* I couldn't read your face at all^1, haha./");
    c_msgnext("\\Ec* Ever since then^1, rarely I feel like.../");
    c_msgnext("\\Ee* Like I could never fully understand you^1, no matter how hard I tried./");
    c_msgnext("\\Ea* But^1, then life just keeps on going and.../");
    c_msgnext("\\Ed* The feeling fades away again./%");
    c_talk_wait();

    c_wait(66);

    
    c_sel(no);
    c_sprite(spr_noelle_sit_closed_eyes_side_b);
    c_addxy(0, noe_spr_offset2_y);
    c_speaker("noelle");
    c_msgset(0, "\\Em* .../");
    c_msgnext("\\EW* Kris..^2. Do you.../%");
    c_talk();
    c_wait_box(1);
    c_sel(kr);
    c_sprite(spr_kris_sit_look);
    c_wait_talk();
    
    // pause kris talk
    c_sel(kr);
    c_sprite(spr_kris_sit);
    c_flip("x"); // face noelle
    c_wait(35);

    c_speaker("noelle");
    c_sel(no);
    // lean looks forward, lean_look looks top left
    c_sprite(spr_noelle_sit_lean_neutral);
    c_addxy(0, -noe_spr_offset2_y);
    c_msgset(0, "\\E2* ...huh?/");
    c_msgnext("\\ED* You want to..^2. show me something?/");
    c_msgnext("\\E3* It's not gonna be some weird bug again^1, is it?/");
    // deep fanon lore
    c_msgnext("\\Eh* Like that time you brought me a dead centipede.../");
    c_msgnext("\\Eg* Well^1, I guess..^3. you THOUGHT it was dead./");
    c_msgnext("\\Ei* Because then it c-crawled up my arm and into my hair.../");
    c_msgnext("\\E8* You know^1, fool me thrice^1, shame on me^1, but fool me quice-/%");
    c_talk();
    // c_wait_box(1);
    // c_sel(no);
    // c_sprite(spr_noelle_sit_lean_normal);
    c_wait_box(2);
    c_sprite(spr_noelle_sit_cover_mouth_look);
    c_addxy(0, noe_spr_offset2_y);
    // c_sprite(spr_noelle_sit_lean_normal);
    // c_sprite(spr_noelle_sit_cover_mouth_steal_car); // STEAL CAR????
    c_wait_box(3);
    // c_sprite(spr_noelle_sit_lean_look);
    c_sprite(spr_noelle_sit_cover_mouth_steal_car_eyes_closed);
    c_addxy(0, -noe_spr_offset2_y);
    c_wait_box(4);
    c_sprite(spr_noelle_sit_cover_mouth_steal_car);
    c_wait_box(6);
    c_sprite(spr_noelle_sit_cover_mouth_steal_car_eyes_closed);
    c_waittalk();

    // pause kris talk
    c_wait(15);
    c_sel(no);
    c_sprite(spr_noelle_sit_lean_old); // lean_neutral but smiling
    c_wait(55);
    c_sprite(spr_noelle_sit_laugh);
    c_addxy(0, noe_spr_offset2_y);
    c_imagespeed(0.20); // 6fps
    c_wait(15); // = 3 frames (1.5 laugh loops)

    c_speaker("noelle");
    c_msgset(0, "\\E3* ...Gosh^1, you're such a weirdo./");
    c_msgnext("\\E4* Okay^1, fine^1, I'll close my eyes./%");
    c_talk();
    c_wait_box(1);
    c_imagespeed(0);
    c_waittalk();

    // noe close eyes
    c_wait(5);
    c_sel(no);
    c_sprite(spr_noelle_sit_closed_eyes_side_b);
    c_fadeout(30);
    c_wait(90);
    // fadeout

    // sfx SOUL remove
    c_soundplay(snd_hurt1);
    c_wait(30);
    c_soundplay(snd_hurt1);
    c_wait(5);
    c_soundplay(snd_break1);
    c_soundplay(snd_grab);
    c_wait(30);
    // sfx soulless step
    c_soundplay(snd_step2);
    c_wait(25);
    c_soundplay(snd_step2);
    c_wait(75);
    // sfx SOUL placed in Noelle's lap
    c_soundplay(snd_bump);
    c_sel(hrt);
    c_visible(true);
    c_stickto(no_actor, -1);
    
    c_sel(kr);
    var kris_scoot = 35;
    c_addxy(kris_scoot, 0);
    c_wait(15);
    // fade back in
    c_fadein(15);
    c_wait(10);
    // noelle opens eyes, notices SOUL
    c_sel(no);
    c_sprite(spr_noelle_sit_look_down_neutral);
    c_wait(5);
    // yowza!
    c_sprite(spr_noelle_sit_gasp_look_down);
    c_shakeobj();
    c_soundplay(snd_noelle_scared);
    c_wait(25);

    c_sel(hrt);

    c_speaker("noelle");
    c_msgset(0, "\\EE* K-Kris^2? What's..^2. Is t-that.../%");
    c_talk();
    c_waittalk();

    // pause kris talk
    c_wait(50);

    c_speaker("noelle");
    c_msgset(0, "\\ED* H-huh?/%");
    c_talk();
    c_waittalk();

    c_wait(20);

    c_sel(no);
    var noe_scoot = -5;
    c_addxy(noe_scoot, 0);
    c_sprite(spr_noelle_sit_shake_surprised);
    c_imagespeed(0);
    c_sel(kr);
    c_shakeobj();
    c_soundplay_x(snd_grab, 0.5, 1.3);
    
    c_speaker("noelle");
    c_msgset(0, "\\ED* Kris..^3. Your voice...!/");
    c_msgnext("\\EC* Huh^2? Okay^1, I won't move.../");
    c_msgnext("\\EI* ...??^4? 'Not you'?^4!&Kris^1, who else...?/");
    c_msgnext("\\EH* ..^2. Just repeat it back..^2. out loud^3? Okay.../%");
    c_talk();
    
    c_wait_box(1);
    c_sel(no);
    c_imagespeed(0);
    c_sprite(spr_noelle_sit_awkward);
    
    c_wait_box(2);
    c_sel(hrt);
    c_stickto_stop(); // stickto keeps its relative offsets so need to do it manually
    c_depth(-9999); // it also restores previous depth
    c_sel(no);
    c_sprite(spr_noelle_sit_expressions);
    c_imageindex(6);
    c_addxy(noe_spr_offset_x, 0);
    
    c_wait_box(3);
    c_sel(no);
    c_imageindex(1); // face left look right
    // c_imageindex(21); // face forward look DL cover mouth
    c_waittalk();
    
    // pause noe
    c_wait(20);
    c_sel(no);
    c_sprite(spr_noelle_sit_look_down_eyes_closed);
    c_addxy(-noe_spr_offset_x, 0);
    c_addxy(0, -noe_spr_offset2_y);
    c_imageindex(0);
    
    c_speaker("noelle");
    c_msgset(0, "\\E5* 'Don't move^1, or you'll cancel it.'/");
    c_msgnext("\\E8* There^1. Happy now^3? ...weirdo./%");
    c_talk();
    c_wait_box(1);
    c_sel(no);
    c_sprite(spr_noelle_sit_cover_mouth_sweat);
    c_addxy(0, noe_spr_offset2_y);
    c_waittalk();

    // kris start scooting away
    c_sel(kr);
    // can't use current kr_actor.x since it unflips above
    c_var_lerp("x", kris_marker.x + kris_scoot, kris_marker.x, 120, 4, "in");
    c_wait(30);
    
    c_sel(no);
    c_sprite(spr_noelle_sit_goofy_what);
    // c_addxy(0, -noe_spr_offset2_y); // here the sprite going up/down a pixel actually fits so it's fine
    c_speaker("noelle");
    c_msgset(0, "\\EJ* Huh? H-hey!/%");
    c_talk();
    c_wait(30); // waits at least 30, or more if text takes longer
    c_waittalk();
    
    c_wait(20);
    
    c_sel(no);
    c_sprite(spr_noelle_sit_strangleface_forward);
    c_imageindex(0);
    c_addxy(noe_spr_offset_x, 0);
    // c_addxy(0, noe_spr_offset2_y); // see above
    c_msgset(0, "\\EH* C'mon^1, what's with you...?/%");
    c_talk();
    c_wait(25);
    c_waittalk();
    
    c_wait(25);
    c_sel(kr);
    c_flip("x");
    c_soundplay(snd_whip_hard);
    c_wait(15);
    
    // noe look cam
    c_sel(no);
    c_sprite(spr_noelle_sit_laugh_goofy_left);
    c_addxy(-noe_spr_offset_x, 0);
    c_msgset(0, "\\EI* (..^2. Is this a human thing?????)/%");
    c_talk();
    c_waittalk();

    c_wait(20);
    c_sel(no);
    c_sprite(spr_noelle_sit_look_down_unhappy);
    c_addxy(0, -noe_spr_offset2_y);
    c_wait(40);

    c_msgset(0, "\\Ed* (Sigh...)/%");
    c_talk();
    c_waittalk();
    
    c_wait(30);
    
    var heart_move_up = 8; // TODO(visuals): 6 if her hand can be layered over the heart
    c_sel(hrt);
    c_stickto_stop();
    c_addxy(0, -heart_move_up);
    c_depthobject(no_actor, -1);

    c_sel(no);
    c_sprite(spr_noelle_sit_fists); // looks like she's holding something
    c_soundplay_x(snd_grab, 0.2, 1);
    c_wait(45);
    
    
    // close eyes
    c_mus2("loopsfxvolume", 0.2, 60);
    
    // TODO(visuals): heart fades slightly slower to remain on screen for a bit longer
    // c_sel(hrt);
    // c_depth(-9999);
    // c_var_lerp("color_blend", 16777215, 0, 90); // doesn't work (flickers red/black because it goes FFFFFF -> FF0000 -> FEFFFF -> etc)
    // c_var_lerp("image_alpha", 1, 0, 90); // seethrough; fixable with a second heart sprite underneath i guess but that's so jank
    
    c_fadeout(60);
    c_wait(60);
    
    // TODO(visuals): hand sprite over heart
    
    // heart over black screen
    // c_sel(hrt);
    // c_var("image_alpha", 0);
    // c_depth(-9999);
    // c_var_lerp("image_alpha", 0, 1, 60);
    
    // c_sel(hand1);
    // c_visible(true);
    // c_var("image_alpha", 0);
    // c_depth(-10001);
    // c_var_lerp("image_alpha", 0, 1, 60);
    // c_var("image_angle", 135);
    
    // c_mus2("loopsfxstop");
    c_mus2("volume", 0.5, 60);
    // c_mus2("loopsfxvolume", 0.4, 60);
    
    c_speaker("noelle");
    c_fefc(0, 0);
    c_msgset(0, "* Kris..^3. You know^1, Kris.../");
    c_msgnext("* Something else..^2. stuck with me^1, since that day./");
    c_msgnext("* The fact you never^1, um..^2. apologized./");
    c_msgnext("* I remember..^2. your mom yelling at you./");
    c_msgnext("* Your shaky voice^1, desperately trying to say something back.../");
    c_msgnext("* But I couldn't make out any of the words./");
    c_msgnext("* After that^1, I kept wondering.../");
    c_msgnext("* Maybe you didn't apologize because you..^2. couldn't./");
    c_msgnext("* Or maybe because you.../");
    c_msgnext("* Didn't feel like you..^3. um..^4. needed to?/");
    c_msgnext("* I-it's so weird^1, isn't it...^2? Why would I think that?/");
    c_msgnext("* But^1, I..^3. I couldn't stop^1, thinking that./%");
    c_talk();
    c_wait_box(6);
    // TODO(visuals): hand wraps slightly tighter?
    c_mus2("loopsfxvolume", 0.1, 60);
    c_mus2("volume", 0.3, 60);
    c_waittalk();
    
    c_mus2("volume", 0, 30);
    c_mus2("loopsfxvolume", 0, 30);
    c_wait(30);
    c_mus2("loopsfxstop");

    c_speaker("noelle");
    c_fefc(0, 0);
    c_msgset(0, "* Recently^1, I keep catching myself thinking.../");
    c_msgnext("* 'I wonder if they think about it^1, sometimes^1, too.'/");
    c_msgnext("* Kris^1, I..^4. All this time^1, I could never really say.../%");
    c_talk();
    c_wait_box(2);
    c_waittalk();

    c_wait(30);
    
    // "clothes rustle" sfx
    c_soundplay_x(snd_grab, 0.1, 0.3);
    
    /*
        so the vision here was something like:
          black screen, heart faintly showing (glowing)
            cutout like in vent segment, or (probably) a transparency gradient
          noelle's hand visible in front of heart (holding it)
          then, at this point, her arms would cross over the heart into a hug
        i feel like, without the visuals, it's not exactly interpretable
        but, at the same time, i'm very much not a sprite artist
    */
    // TODO(visuals): noe hug heart (move hand sprites)
    // c_sel(hand2);
    // c_depth(-10000);
    // c_var("image_alpha", 0);
    // c_var_lerp("image_alpha", 0, 1, 90);
    // TODO(visuals): rotate and move a bit (appearance of hug-like movement)
    // c_visible(true);
    
    c_wait(30);
    c_mus2("initloop", "heartbeat.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 0.8, 60);
    // c_mus2("volume", 1.25, 30);
    c_mus2("pitch", 1.2, 10);

    c_wait(60);

    c_speaker("noelle");
    c_fefc(0, 0);
    c_msgset(0, "* ..^3. It's okay^5. It's okay^1, Kris./");
    c_msgnext("* Don't worry^3. It doesn't matter..^4. anymore./");
    c_msgnext("* I won't say 'I forgive you'.../");
    c_msgnext("* I don't think it feels right for me to say that./");
    c_msgnext("* I mean^1, right now^1, we're living completely different lives..^2. aren't we?/");
    c_msgnext("* And if neither of us remembers.../");
    c_msgnext("* Who's to say that..^3. anything..^2. happened at all?/%");
    c_talk();
    c_wait_box(1);
    c_waittalk();
    
    c_mus2("volume", 1, 60);
    c_mus2("pitch", 1.3, 60);
    c_wait(60);

    c_msgset(0, "* So..^2. don't worry^3. Okay?/");
    c_msgnext("* I'll make..^3. new memories./");
    c_msgnext("* I just..^5. want my Kris back./%");
    c_talk();
    c_waittalk();
    
    c_mus2("volume", 0, 60);
    // c_sel(hrt);
    // c_var_lerp("image_alpha", 1, 0, 120);
    c_wait(150);
    c_mus("free_all");

    c_sel(kr);
    c_sprite(spr_kris_sit_look);

    c_fadein(120);
    c_wait(120);
    
    // done
    con = 99;
    c_waitcustom();
}

if (con == 99 && customcon == 1)
{
    global.interact = 0;
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
    room_goto(room_lw_noellehouse_kitchen);
}
