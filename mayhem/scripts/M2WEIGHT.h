#ifndef __M2SIZE_H_
#define __M2SIZE_H_
#include "MayhemHeights.h"
#define DEFAULT_WEIGHT (10000)
#define CALC_WEIGHT \
w=0; \
\
/*First, the units that have weight values. Mainly determined by footprint size (with some exceptions)*/\
\
w=w+(h==ARMACK)*6+(h==ARMAMPH)*6+(h==ARMASER)*6+(h==ARMCH)*6+(h==ARMCIPH)*6+(h==ARMCK)*6;\
w=w+(h==ARMCROC)*6+(h==ARMFARK)*6+(h==ARMFAST)*6+(h==ARMFAV)*6+(h==ARMFIDO)*6+(h==ARMFLASH)*6;\
w=w+(h==ARMFLEA)*6+(h==ARMHAM)*6+(h==ARMHDPW)*6+(h==ARMJETH)*6+(h==ARMLATNK)*6+(h==ARMMARK)*6;\
w=w+(h==ARMLMART)*6+(h==ARMMAV)*6+(h==ARMMLV)*6+(h==ARMODIN)*6+(h==ARMPW)*6+(h==ARMRECCY)*6;\
w=w+(h==ARMROCK)*6+(h==ARMSH)*6+(h==ARMSPDJ)*6+(h==ARMSPDR)*6+(h==ARMSPY)*6+(h==ARMSTUMP)*6;\
w=w+(h==ARMWAR)*6+(h==ARMACH)*96+(h==ARMACV)*96+(h==ARMAH)*96+(h==ARMANAC)*96+(h==ARMBOA)*96;\
w=w+(h==ARMBULL)*96+(h==ARMCOM)*96+(h==ARMCV)*96+(h==ARMDH)*96+(h==ARMDUKE)*96+(h==ARMFH)*96;\
w=w+(h==ARMHH)*96+(h==ARMJAM)*96+(h==ARMJANUS)*96+(h==ARMMANNI)*96+(h==ARMMERL)*96+(h==ARMMH)*96;\
w=w+(h==ARMMOOSE)*96+(h==ARMROVER)*96+(h==ARMSAM)*96+(h==ARMSCORP)*96+(h==ARMSEER)*96+(h==ARMSHOCK)*96;\
w=w+(h==ARMSNIPE)*96+(h==ARMSPDAA)*96+(h==ARMSPDAM)*96+(h==ARMSPDC)*96+(h==ARMSPDF)*96+(h==ARMSPDLA)*96;\
w=w+(h==ARMSPDLR)*96+(h==ARMSPDRK)*96+(h==ARMSPID)*96+(h==ARMVADER)*96+(h==ARMXCH)*96+(h==ARMXCK)*96;\
w=w+(h==ARMCS)*800+(h==ARMARSPD)*800+(h==ARMARTH)*800+(h==ARMIMPAL)*800+(h==ARMJACK)*800+(h==ARMMSHIP)*800;\
w=w+(h==ARMORCA)*800+(h==ARMPHOVR)*800+(h==ARMPT)*800+(h==ARMRAZ)*800+(h==ARMSCAB)*800+(h==ARMSCUDD)*800;\
w=w+(h==ARMSJAM)*800+(h==ARMTARAN)*800+(h==ARMTEM)*800+(h==ARMTIGER)*800+(h==ARMTOM)*800+(h==ARMVANG)*800;\
w=w+(h==ARMWOLF)*800+(h==ARMAAS)*4000+(h==ARMANNIS)*4000+(h==ARMCRUS)*4000+(h==ARMG2)*4000+(h==ARMROY)*4000;\
w=w+(h==ARMDREDH)*8000+(h==ARMMF)*8000+(h==ARMSHIVA)*8000+(h==ARMDRAKE)*8000+(h==ARMBATS)*10000+(h==ARMCARRY)*10000;\
w=w+(h==CORACH)*96+(h==CORACK)*6+(h==CORACV)*96+(h==CORADON)*800+(h==CORADVRH)*800+(h==CORAH)*96; \
w=w+(h==CORAIRRT)*800+(h==CORAK)*6+(h==CORAMPH)*6+(h==CORARCH)*4000+(h==CORARTH)*800+(h==CORAVAL)*96; \
w=w+(h==CORBATS)*10000+(h==CORBEETL)*6+(h==CORBOSS)*96+(h==CORBSWRD)*8000+(h==CORCABER)*96+(h==CORCAN)*6; \
w=w+(h==CORCARRY)*10000+(h==CORCH)*6+(h==CORCHEL)*96+(h==CORCK)*6+(h==CORCOM)*96+(h==CORCRASH)*6; \
w=w+(h==CORCREM)*96+(h==CORCRUS)*4000+(h==CORCS)*800+(h==CORCTORT)*96+(h==CORCV)*96+(h==CORDEFIL)*8000; \
w=w+(h==CORDH)*96+(h==CORETER)*6+(h==CORFAST)*6+(h==CORFAV)*6+(h==CORFDEV)*800+(h==CORFH)*96; \
w=w+(h==CORGARP)*6+(h==CORGATOR)*6+(h==CORGILA)*96+(h==CORGOL)*96+(h==CORGORG)*800+(h==CORHATCH)*6; \
w=w+(h==CORHH)*96+(h==CORHRK)*6+(h==CORJUP)*800+(h==CORKETZ)*800+(h==CORKROG)*8000+(h==CORLAS)*96; \
w=w+(h==CORLEVLR)*6+(h==CORMABM)*96+(h==CORMAK)*6+(h==CORMART)*96+(h==CORMDOOM)*800+(h==CORMF)*8000; \
w=w+(h==CORMH)*96+(h==CORMIST)*96+(h==CORMLV)*6+(h==CORMMTH)*96+(h==CORMORT)*6+(h==CORMSHIP)*4000; \
w=w+(h==CORNECRO)*96+(h==COROMNI)*4000+(h==CORPEN)*96+(h==CORPHOVR)*800+(h==CORPREC)*800+(h==CORPROTEUS)*800; \
w=w+(h==CORPT)*800+(h==CORPYRO)*6+(h==CORRAID)*6+(h==CORRATTLE)*800+(h==CORREAP)*96+(h==CORREAVR)*96; \
w=w+(h==CORREX)*800+(h==CORROACH)*96+(h==CORROY)*4000+(h==CORSAT)*96+(h==CORSCAN)*96+(h==CORSEAL)*6; \
w=w+(h==CORSENT)*96+(h==CORSH)*6+(h==CORSJAM)*800+(h==CORSLING)*96+(h==CORSNAP)*96+(h==CORSNIPE)*96; \
w=w+(h==CORSPEC)*6+(h==CORSPY)*6+(h==CORSTORM)*6+(h==CORSUMO)*96+(h==CORTHUD)*6+(h==CORTJAM)*96; \
w=w+(h==CORTNT)*96+(h==CORTRUCK)*96+(h==CORVICE)*800+(h==CORVIKNG)*800+(h==CORVOYR)*6+(h==CORVRAD)*96; \
w=w+(h==CORWRECK)*96+(h==CORXCH)*800+(h==CORXCK)*96+(h==CORXCS)*4000+(h==CORXCV)*800; \
/*Finally, the unknown units*/\
if(w==0) \
{ \
	w=DEFAULT_WEIGHT; \
} \
// Also, hope as strongly as you can that there's isn't any two units with the same height but different TCLASS.
// So, from now on, all we have to do is
//
// var h,w;
// h=get UNIT_HEIGHT(id);
// CALC_WEIGHT
//
// and automatically will take the value of the transportation cost of the unit of id id.
#endif