//
//  MKPolygon+WDComprensoriTn.m
//  MapTest
//
//  Created by Walter Da Col on 11/15/13.
//  Copyright (c) 2013 Walter Da Col. All rights reserved.
//

#import "MKPolygon+WDComprensoriTn.h"

@implementation MKPolygon (WDComprensoriTn)
    
+ (BOOL) polygon:(MKPolygon *)polygon withIdentifier:(id<NSCopying>)identifier containsCoordinate:(CLLocationCoordinate2D)coordinate{
    static NSLock *polygonLock;
    static NSMutableDictionary *polygonDict;
    static dispatch_once_t onceLock;
    static dispatch_once_t onceDict;
    
    UIBezierPath *pathToCheck = nil;
    
    dispatch_once(&onceLock, ^{
        polygonLock = [NSLock new];
    });
    
    [polygonLock lock];{
        
        dispatch_once(&onceDict, ^{
            polygonDict = [NSMutableDictionary new];
        });
        
        // If identifier is not set skip caching
        if ((identifier)&&([polygonDict objectForKey:identifier])){
            
            // Get path
            pathToCheck = polygonDict[identifier];
            
        } else {
            
            // Create path
            CGMutablePathRef mpr = CGPathCreateMutable();
            MKMapPoint *polygonPoints = polygon.points;
            
            for (int p=0; p < polygon.pointCount; p++)
            {
                MKMapPoint mp = polygonPoints[p];
                if (p == 0)
                    CGPathMoveToPoint(mpr, NULL, mp.x, mp.y);
                else
                    CGPathAddLineToPoint(mpr, NULL, mp.x, mp.y);
            }
            // Create bezierPath
            pathToCheck = [UIBezierPath bezierPathWithCGPath:mpr];
            
            // Add to cache if identifier is used
            if (identifier){
                [polygonDict setObject:[pathToCheck copy] forKey:identifier];
            }
            
            // Release
            CGPathRelease(mpr);
        }

    }
    [polygonLock unlock];
    
    // Check point
    MKMapPoint coordinatePoint = MKMapPointForCoordinate(coordinate);
    CGPoint mapPointAsCGP = CGPointMake(coordinatePoint.x, coordinatePoint.y);
    
    return [pathToCheck containsPoint:mapPointAsCGP];
}
+ (MKPolygon *) polygonForTrentino {
    CLLocationCoordinate2D points[168];
    
    points[0] = CLLocationCoordinate2DMake(45.80225581871769, 10.64204401892656);
    points[1] = CLLocationCoordinate2DMake(45.82199385289115, 10.65607032342845);
    points[2] = CLLocationCoordinate2DMake(45.83265322127443, 10.65407837074686);
    points[3] = CLLocationCoordinate2DMake(45.84032679395147, 10.70000714134293);
    points[4] = CLLocationCoordinate2DMake(45.82946974855277, 10.75453543233626);
    points[5] = CLLocationCoordinate2DMake(45.84029226849172, 10.77303498980892);
    points[6] = CLLocationCoordinate2DMake(45.83260160422927, 10.79207627229849);
    points[7] = CLLocationCoordinate2DMake(45.83697243116692, 10.82415256763873);
    points[8] = CLLocationCoordinate2DMake(45.81313480809523, 10.88703309194129);
    points[9] = CLLocationCoordinate2DMake(45.77433815001805, 10.8817556510364);
    points[10] = CLLocationCoordinate2DMake(45.71841744052544, 10.84672857793134);
    points[11] = CLLocationCoordinate2DMake(45.69788182337511, 10.92603456360062);
    points[12] = CLLocationCoordinate2DMake(45.68707564472702, 10.91112381743556);
    points[13] = CLLocationCoordinate2DMake(45.67424725454914, 10.94327781700261);
    points[14] = CLLocationCoordinate2DMake(45.71888906737018, 11.01426792067904);
    points[15] = CLLocationCoordinate2DMake(45.71684894033041, 11.05716429506459);
    points[16] = CLLocationCoordinate2DMake(45.6892758218555, 11.12965065589197);
    points[17] = CLLocationCoordinate2DMake(45.73742862324124, 11.17892850608485);
    points[18] = CLLocationCoordinate2DMake(45.78467093545975, 11.17241641863744);
    points[19] = CLLocationCoordinate2DMake(45.7828653471659, 11.20290536493089);
    points[20] = CLLocationCoordinate2DMake(45.79975679947507, 11.19598930571075);
    points[21] = CLLocationCoordinate2DMake(45.81533151704383, 11.19199757160014);
    points[22] = CLLocationCoordinate2DMake(45.8553382112415, 11.2377041006964);
    points[23] = CLLocationCoordinate2DMake(45.91704244199207, 11.25998460320803);
    points[24] = CLLocationCoordinate2DMake(45.93076812660122, 11.30542899476987);
    points[25] = CLLocationCoordinate2DMake(45.91058574766978, 11.34699486407231);
    points[26] = CLLocationCoordinate2DMake(45.92914741406594, 11.35637129446699);
    points[27] = CLLocationCoordinate2DMake(45.94696756901318, 11.38347815110396);
    points[28] = CLLocationCoordinate2DMake(45.97966501817795, 11.3747435645524);
    points[29] = CLLocationCoordinate2DMake(45.98275220720242, 11.40699199619817);
    points[30] = CLLocationCoordinate2DMake(45.98112797554788, 11.45156146918836);
    points[31] = CLLocationCoordinate2DMake(46.00782157132707, 11.48875723923659);
    points[32] = CLLocationCoordinate2DMake(46.0119495478237, 11.54196606438476);
    points[33] = CLLocationCoordinate2DMake(46.0054874958305, 11.57631249469758);
    points[34] = CLLocationCoordinate2DMake(45.96931779903901, 11.58725209833382);
    points[35] = CLLocationCoordinate2DMake(45.96172070132782, 11.62796960502434);
    points[36] = CLLocationCoordinate2DMake(45.97151585077715, 11.68725563803335);
    points[37] = CLLocationCoordinate2DMake(45.98982467502038, 11.6878153134506);
    points[38] = CLLocationCoordinate2DMake(46.01610370534306, 11.66517847078751);
    points[39] = CLLocationCoordinate2DMake(46.04077138363534, 11.67063521664016);
    points[40] = CLLocationCoordinate2DMake(46.04506507892207, 11.7048896074547);
    points[41] = CLLocationCoordinate2DMake(46.08353261163602, 11.68417039120477);
    points[42] = CLLocationCoordinate2DMake(46.10219890648699, 11.71895863170355);
    points[43] = CLLocationCoordinate2DMake(46.09630670498424, 11.7550384157116);
    points[44] = CLLocationCoordinate2DMake(46.10681094993402, 11.77102504349318);
    points[45] = CLLocationCoordinate2DMake(46.09840878841732, 11.81104064696757);
    points[46] = CLLocationCoordinate2DMake(46.11756204527512, 11.88437104788347);
    points[47] = CLLocationCoordinate2DMake(46.15541913591837, 11.91939222049389);
    points[48] = CLLocationCoordinate2DMake(46.16759599544215, 11.9367392064088);
    points[49] = CLLocationCoordinate2DMake(46.18875931416171, 11.96306214930989);
    points[50] = CLLocationCoordinate2DMake(46.20411742700263, 11.96085018926347);
    points[51] = CLLocationCoordinate2DMake(46.20518517004941, 11.93725743293755);
    points[52] = CLLocationCoordinate2DMake(46.22510823525704, 11.90956637281115);
    points[53] = CLLocationCoordinate2DMake(46.24540510260794, 11.92144913005009);
    points[54] = CLLocationCoordinate2DMake(46.25877291119831, 11.88612143348006);
    points[55] = CLLocationCoordinate2DMake(46.27435853471758, 11.88480527102378);
    points[56] = CLLocationCoordinate2DMake(46.27374815200145, 11.83124442231626);
    points[57] = CLLocationCoordinate2DMake(46.30732415275909, 11.84104750419979);
    points[58] = CLLocationCoordinate2DMake(46.32425065339686, 11.83200874777492);
    points[59] = CLLocationCoordinate2DMake(46.3342754907483, 11.80300294197105);
    points[60] = CLLocationCoordinate2DMake(46.34261024980844, 11.80155571230596);
    points[61] = CLLocationCoordinate2DMake(46.34967038587119, 11.78088515348558);
    points[62] = CLLocationCoordinate2DMake(46.35774857341755, 11.7749453945268);
    points[63] = CLLocationCoordinate2DMake(46.3662939237856, 11.79205908355984);
    points[64] = CLLocationCoordinate2DMake(46.3659299341266, 11.83421870943335);
    points[65] = CLLocationCoordinate2DMake(46.38358952591624, 11.83598008728892);
    points[66] = CLLocationCoordinate2DMake(46.40961820912992, 11.84286436206876);
    points[67] = CLLocationCoordinate2DMake(46.43364521113544, 11.85159802427022);
    points[68] = CLLocationCoordinate2DMake(46.43301814931239, 11.87041375979883);
    points[69] = CLLocationCoordinate2DMake(46.44130433046796, 11.88826570201194);
    points[70] = CLLocationCoordinate2DMake(46.46412464315617, 11.88699362718196);
    points[71] = CLLocationCoordinate2DMake(46.47204450736818, 11.87518189978553);
    points[72] = CLLocationCoordinate2DMake(46.47686181532586, 11.81366062262541);
    points[73] = CLLocationCoordinate2DMake(46.49789584445778, 11.81420787027581);
    points[74] = CLLocationCoordinate2DMake(46.50871335914902, 11.8295225809337);
    points[75] = CLLocationCoordinate2DMake(46.52079749241069, 11.82536741529504);
    points[76] = CLLocationCoordinate2DMake(46.53150000216461, 11.81079762429724);
    points[77] = CLLocationCoordinate2DMake(46.52274417611109, 11.79409469555167);
    points[78] = CLLocationCoordinate2DMake(46.51308707004737, 11.79178863032161);
    points[79] = CLLocationCoordinate2DMake(46.5050767232131, 11.74626466546684);
    points[80] = CLLocationCoordinate2DMake(46.51193292693757, 11.71474900008074);
    points[81] = CLLocationCoordinate2DMake(46.50634451727691, 11.70046544840741);
    points[82] = CLLocationCoordinate2DMake(46.49961338725856, 11.68378151314364);
    points[83] = CLLocationCoordinate2DMake(46.50224528688845, 11.63765238753261);
    points[84] = CLLocationCoordinate2DMake(46.49796016085286, 11.63176297912344);
    points[85] = CLLocationCoordinate2DMake(46.4933772387318, 11.63316441346138);
    points[86] = CLLocationCoordinate2DMake(46.48297952436697, 11.64890834518356);
    points[87] = CLLocationCoordinate2DMake(46.47318283773658, 11.64448451796397);
    points[88] = CLLocationCoordinate2DMake(46.47101312871528, 11.6263549079863);
    points[89] = CLLocationCoordinate2DMake(46.46372052476603, 11.62709495920841);
    points[90] = CLLocationCoordinate2DMake(46.44304578979126, 11.61666496345636);
    points[91] = CLLocationCoordinate2DMake(46.42664696862256, 11.62006678343181);
    points[92] = CLLocationCoordinate2DMake(46.38872708594653, 11.60133323124858);
    points[93] = CLLocationCoordinate2DMake(46.38241114237439, 11.56154908540237);
    points[94] = CLLocationCoordinate2DMake(46.34347611584823, 11.54872908561465);
    points[95] = CLLocationCoordinate2DMake(46.35536800271704, 11.52591146383857);
    points[96] = CLLocationCoordinate2DMake(46.36284534524454, 11.47966831716107);
    points[97] = CLLocationCoordinate2DMake(46.34735268015988, 11.45918451904128);
    points[98] = CLLocationCoordinate2DMake(46.33310022150869, 11.45363074495498);
    points[99] = CLLocationCoordinate2DMake(46.32439116822636, 11.40569690032322);
    points[100] = CLLocationCoordinate2DMake(46.30322037732167, 11.39251149365067);
    points[101] = CLLocationCoordinate2DMake(46.29807539209027, 11.36116788396915);
    points[102] = CLLocationCoordinate2DMake(46.26817141831025, 11.39493063937197);
    points[103] = CLLocationCoordinate2DMake(46.26784828702964, 11.36177416408477);
    points[104] = CLLocationCoordinate2DMake(46.29178400668029, 11.33684348646984);
    points[105] = CLLocationCoordinate2DMake(46.2842972950984, 11.31429925561385);
    points[106] = CLLocationCoordinate2DMake(46.26250203532276, 11.31127348798656);
    points[107] = CLLocationCoordinate2DMake(46.26113014589664, 11.29559782989726);
    points[108] = CLLocationCoordinate2DMake(46.22203315423874, 11.21252877533325);
    points[109] = CLLocationCoordinate2DMake(46.2332133723241, 11.17684589895494);
    points[110] = CLLocationCoordinate2DMake(46.25519449613832, 11.20446894934443);
    points[111] = CLLocationCoordinate2DMake(46.28259202284713, 11.14135161336903);
    points[112] = CLLocationCoordinate2DMake(46.29175012970022, 11.16535288143488);
    points[113] = CLLocationCoordinate2DMake(46.34425302806304, 11.20394463768852);
    points[114] = CLLocationCoordinate2DMake(46.36348249130425, 11.19119954023149);
    points[115] = CLLocationCoordinate2DMake(46.39551361985473, 11.21856748591355);
    points[116] = CLLocationCoordinate2DMake(46.4305116305794, 11.20721242020988);
    points[117] = CLLocationCoordinate2DMake(46.46209527131753, 11.22413960629216);
    points[118] = CLLocationCoordinate2DMake(46.50978651188545, 11.18611932198012);
    points[119] = CLLocationCoordinate2DMake(46.47882909117005, 11.13049902567897);
    points[120] = CLLocationCoordinate2DMake(46.50230010010886, 11.0913040552447);
    points[121] = CLLocationCoordinate2DMake(46.53238949375925, 11.0835426105963);
    points[122] = CLLocationCoordinate2DMake(46.5147294581402, 11.03411355723734);
    points[123] = CLLocationCoordinate2DMake(46.48845895619636, 11.06105270038176);
    points[124] = CLLocationCoordinate2DMake(46.43904662870316, 11.07357712826236);
    points[125] = CLLocationCoordinate2DMake(46.44773027488585, 11.04031972546515);
    points[126] = CLLocationCoordinate2DMake(46.48240344701908, 10.99089449486585);
    points[127] = CLLocationCoordinate2DMake(46.48162702948758, 10.96670975100964);
    points[128] = CLLocationCoordinate2DMake(46.44560678989434, 10.91134679697809);
    points[129] = CLLocationCoordinate2DMake(46.43896712812239, 10.86527026603667);
    points[130] = CLLocationCoordinate2DMake(46.44384191131395, 10.79967064739174);
    points[131] = CLLocationCoordinate2DMake(46.48587702392249, 10.7642480410158);
    points[132] = CLLocationCoordinate2DMake(46.48681997439434, 10.74682684955322);
    points[133] = CLLocationCoordinate2DMake(46.45171268359601, 10.68266264406242);
    points[134] = CLLocationCoordinate2DMake(46.44620037636397, 10.6202102959552);
    points[135] = CLLocationCoordinate2DMake(46.43062128326596, 10.61198581841135);
    points[136] = CLLocationCoordinate2DMake(46.40474271422979, 10.62659035564544);
    points[137] = CLLocationCoordinate2DMake(46.37697645040831, 10.6055401569514);
    points[138] = CLLocationCoordinate2DMake(46.37565951347676, 10.56268397236707);
    points[139] = CLLocationCoordinate2DMake(46.3527959242154, 10.50833693323615);
    points[140] = CLLocationCoordinate2DMake(46.32470956005713, 10.56730636449965);
    points[141] = CLLocationCoordinate2DMake(46.30243365467479, 10.57983724151116);
    points[142] = CLLocationCoordinate2DMake(46.28165299517324, 10.56145737504934);
    points[143] = CLLocationCoordinate2DMake(46.27133389385638, 10.57713743342597);
    points[144] = CLLocationCoordinate2DMake(46.2474259264259, 10.5813011965695);
    points[145] = CLLocationCoordinate2DMake(46.22228188614209, 10.56905780188251);
    points[146] = CLLocationCoordinate2DMake(46.18973441349951, 10.54330686932116);
    points[147] = CLLocationCoordinate2DMake(46.16423551818342, 10.56985783271915);
    points[148] = CLLocationCoordinate2DMake(46.13995456162029, 10.54652194926701);
    points[149] = CLLocationCoordinate2DMake(46.10445850019916, 10.54779618340138);
    points[150] = CLLocationCoordinate2DMake(46.05526428761895, 10.4778901613061);
    points[151] = CLLocationCoordinate2DMake(46.01957719201528, 10.48126072223076);
    points[152] = CLLocationCoordinate2DMake(46.0133443231395, 10.45769212832489);
    points[153] = CLLocationCoordinate2DMake(45.98451264834042, 10.4543361775193);
    points[154] = CLLocationCoordinate2DMake(45.96898709922635, 10.48818920038718);
    points[155] = CLLocationCoordinate2DMake(45.93199102796574, 10.49855063821323);
    points[156] = CLLocationCoordinate2DMake(45.92050987655561, 10.50705587910027);
    points[157] = CLLocationCoordinate2DMake(45.89934610389144, 10.49418685627296);
    points[158] = CLLocationCoordinate2DMake(45.88298807395991, 10.49120005847007);
    points[159] = CLLocationCoordinate2DMake(45.86921220641902, 10.50314560270342);
    points[160] = CLLocationCoordinate2DMake(45.82492976924165, 10.50262770421252);
    points[161] = CLLocationCoordinate2DMake(45.82323416353802, 10.52956316288698);
    points[162] = CLLocationCoordinate2DMake(45.81774420191431, 10.54316493672464);
    points[163] = CLLocationCoordinate2DMake(45.80802662095618, 10.52501477633486);
    points[164] = CLLocationCoordinate2DMake(45.787368835256, 10.53574794402826);
    points[165] = CLLocationCoordinate2DMake(45.78453102394072, 10.56754758462766);
    points[166] = CLLocationCoordinate2DMake(45.8060633173279, 10.61651525944038);
    points[167] = CLLocationCoordinate2DMake(45.80225581871769, 10.64204401892656);
    
    MKPolygon *polygon = [MKPolygon polygonWithCoordinates:points count:168];
    polygon.title = @"Trentino";
    
    return polygon;
}
+ (MKPolygon *) polygonForC1 {
    CLLocationCoordinate2D points[69];
    
    points[0] = CLLocationCoordinate2DMake(46.2028415623388, 11.35775399826451);
    points[1] = CLLocationCoordinate2DMake(46.1952729327093, 11.36190906416373);
    points[2] = CLLocationCoordinate2DMake(46.18614389535001, 11.34718408215813);
    points[3] = CLLocationCoordinate2DMake(46.18511527808606, 11.38452956604783);
    points[4] = CLLocationCoordinate2DMake(46.17608535406345, 11.38480063238779);
    points[5] = CLLocationCoordinate2DMake(46.16820944853771, 11.39740822587245);
    points[6] = CLLocationCoordinate2DMake(46.16305439259165, 11.40734182711131);
    points[7] = CLLocationCoordinate2DMake(46.16553743637402, 11.421803665758);
    points[8] = CLLocationCoordinate2DMake(46.1694065180197, 11.42376061414714);
    points[9] = CLLocationCoordinate2DMake(46.17663140816128, 11.44425967278968);
    points[10] = CLLocationCoordinate2DMake(46.17186645571648, 11.45879256600789);
    points[11] = CLLocationCoordinate2DMake(46.18388897625341, 11.49857069837766);
    points[12] = CLLocationCoordinate2DMake(46.2008155618669, 11.51362340764425);
    points[13] = CLLocationCoordinate2DMake(46.20335907050169, 11.534996122009);
    points[14] = CLLocationCoordinate2DMake(46.21240650401344, 11.53626791376113);
    points[15] = CLLocationCoordinate2DMake(46.22150426049978, 11.56279927801886);
    points[16] = CLLocationCoordinate2DMake(46.21999650100141, 11.57477525833323);
    points[17] = CLLocationCoordinate2DMake(46.22583885189157, 11.59013747156864);
    points[18] = CLLocationCoordinate2DMake(46.23603159769874, 11.60041618151515);
    points[19] = CLLocationCoordinate2DMake(46.26125707904549, 11.62442972494524);
    points[20] = CLLocationCoordinate2DMake(46.25732968373556, 11.6454107524317);
    points[21] = CLLocationCoordinate2DMake(46.25683258453999, 11.67739938241076);
    points[22] = CLLocationCoordinate2DMake(46.26290159590749, 11.69057418803241);
    points[23] = CLLocationCoordinate2DMake(46.26143365373412, 11.71756822172234);
    points[24] = CLLocationCoordinate2DMake(46.26598047887871, 11.72859065204071);
    points[25] = CLLocationCoordinate2DMake(46.27862530050653, 11.72510698367439);
    points[26] = CLLocationCoordinate2DMake(46.29395521193171, 11.71022783871709);
    points[27] = CLLocationCoordinate2DMake(46.30012088628593, 11.71668423147202);
    points[28] = CLLocationCoordinate2DMake(46.3016485575224, 11.73237520529949);
    points[29] = CLLocationCoordinate2DMake(46.30679437582371, 11.74795382879419);
    points[30] = CLLocationCoordinate2DMake(46.31613171394783, 11.7544211541671);
    points[31] = CLLocationCoordinate2DMake(46.31165368289166, 11.74064282631183);
    points[32] = CLLocationCoordinate2DMake(46.321500413027, 11.74040301426689);
    points[33] = CLLocationCoordinate2DMake(46.31801828471671, 11.72554999099652);
    points[34] = CLLocationCoordinate2DMake(46.32521166989613, 11.7116034355368);
    points[35] = CLLocationCoordinate2DMake(46.34483746489953, 11.70142546205253);
    points[36] = CLLocationCoordinate2DMake(46.34460871661233, 11.69077866889531);
    points[37] = CLLocationCoordinate2DMake(46.33730169233553, 11.67631644196646);
    points[38] = CLLocationCoordinate2DMake(46.34259937593937, 11.66358004568369);
    points[39] = CLLocationCoordinate2DMake(46.33714572707688, 11.64368062282012);
    points[40] = CLLocationCoordinate2DMake(46.34574221234678, 11.63462096280074);
    points[41] = CLLocationCoordinate2DMake(46.33800637460391, 11.62043725886722);
    points[42] = CLLocationCoordinate2DMake(46.34267245322027, 11.61678484959224);
    points[43] = CLLocationCoordinate2DMake(46.35042712911356, 11.62715956242776);
    points[44] = CLLocationCoordinate2DMake(46.36490513133619, 11.59597032404947);
    points[45] = CLLocationCoordinate2DMake(46.37999449928249, 11.59343252350514);
    points[46] = CLLocationCoordinate2DMake(46.38872708594653, 11.60133323124858);
    points[47] = CLLocationCoordinate2DMake(46.38241114237439, 11.56154908540237);
    points[48] = CLLocationCoordinate2DMake(46.34347611584823, 11.54872908561465);
    points[49] = CLLocationCoordinate2DMake(46.35536800271704, 11.52591146383857);
    points[50] = CLLocationCoordinate2DMake(46.36284534524454, 11.47966831716107);
    points[51] = CLLocationCoordinate2DMake(46.34735268015988, 11.45918451904128);
    points[52] = CLLocationCoordinate2DMake(46.33310022150869, 11.45363074495498);
    points[53] = CLLocationCoordinate2DMake(46.32439116822636, 11.40569690032322);
    points[54] = CLLocationCoordinate2DMake(46.30322037732167, 11.39251149365067);
    points[55] = CLLocationCoordinate2DMake(46.29807539209027, 11.36116788396915);
    points[56] = CLLocationCoordinate2DMake(46.26817141831025, 11.39493063937197);
    points[57] = CLLocationCoordinate2DMake(46.26784828702964, 11.36177416408477);
    points[58] = CLLocationCoordinate2DMake(46.29178400668029, 11.33684348646984);
    points[59] = CLLocationCoordinate2DMake(46.2842972950984, 11.31429925561385);
    points[60] = CLLocationCoordinate2DMake(46.26250203532276, 11.31127348798656);
    points[61] = CLLocationCoordinate2DMake(46.24447638451937, 11.32409605368119);
    points[62] = CLLocationCoordinate2DMake(46.25081677695238, 11.33046075365589);
    points[63] = CLLocationCoordinate2DMake(46.23948528946971, 11.3400590967341);
    points[64] = CLLocationCoordinate2DMake(46.22018470671196, 11.35008164069356);
    points[65] = CLLocationCoordinate2DMake(46.22416788563811, 11.35365581242408);
    points[66] = CLLocationCoordinate2DMake(46.21970867103206, 11.36174108849776);
    points[67] = CLLocationCoordinate2DMake(46.2020448807413, 11.36515622721326);
    points[68] = CLLocationCoordinate2DMake(46.2028415623388, 11.35775399826451);
    
    MKPolygon *polygon = [MKPolygon polygonWithCoordinates:points count:69];
    polygon.title = @"C1";
    
    return polygon;
}
+ (MKPolygon *) polygonForC2 {
    CLLocationCoordinate2D points[50];
    
    points[0] = CLLocationCoordinate2DMake(46.09630670498424, 11.7550384157116);
    points[1] = CLLocationCoordinate2DMake(46.10681094993402, 11.77102504349318);
    points[2] = CLLocationCoordinate2DMake(46.09840878841732, 11.81104064696757);
    points[3] = CLLocationCoordinate2DMake(46.11756204527512, 11.88437104788347);
    points[4] = CLLocationCoordinate2DMake(46.15541913591837, 11.91939222049389);
    points[5] = CLLocationCoordinate2DMake(46.16759599544215, 11.9367392064088);
    points[6] = CLLocationCoordinate2DMake(46.18875931416171, 11.96306214930989);
    points[7] = CLLocationCoordinate2DMake(46.20411742700263, 11.96085018926347);
    points[8] = CLLocationCoordinate2DMake(46.20518517004941, 11.93725743293755);
    points[9] = CLLocationCoordinate2DMake(46.22510823525704, 11.90956637281115);
    points[10] = CLLocationCoordinate2DMake(46.24540510260794, 11.92144913005009);
    points[11] = CLLocationCoordinate2DMake(46.25877291119831, 11.88612143348006);
    points[12] = CLLocationCoordinate2DMake(46.27435853471758, 11.88480527102378);
    points[13] = CLLocationCoordinate2DMake(46.27374815200145, 11.83124442231626);
    points[14] = CLLocationCoordinate2DMake(46.30732415275909, 11.84104750419979);
    points[15] = CLLocationCoordinate2DMake(46.32425065339686, 11.83200874777492);
    points[16] = CLLocationCoordinate2DMake(46.3342754907483, 11.80300294197105);
    points[17] = CLLocationCoordinate2DMake(46.34261024980844, 11.80155571230596);
    points[18] = CLLocationCoordinate2DMake(46.34967038587119, 11.78088515348558);
    points[19] = CLLocationCoordinate2DMake(46.35774857341755, 11.7749453945268);
    points[20] = CLLocationCoordinate2DMake(46.36057624323351, 11.76367902179559);
    points[21] = CLLocationCoordinate2DMake(46.35334089326779, 11.76665360991825);
    points[22] = CLLocationCoordinate2DMake(46.34928993074328, 11.75897673178718);
    points[23] = CLLocationCoordinate2DMake(46.35554354565583, 11.75216150030064);
    points[24] = CLLocationCoordinate2DMake(46.35249867879664, 11.74676246165193);
    points[25] = CLLocationCoordinate2DMake(46.33434987399955, 11.75345393698246);
    points[26] = CLLocationCoordinate2DMake(46.32969468623793, 11.748125008216);
    points[27] = CLLocationCoordinate2DMake(46.31613171394783, 11.7544211541671);
    points[28] = CLLocationCoordinate2DMake(46.30679437582371, 11.74795382879419);
    points[29] = CLLocationCoordinate2DMake(46.3016485575224, 11.73237520529949);
    points[30] = CLLocationCoordinate2DMake(46.30012088628593, 11.71668423147202);
    points[31] = CLLocationCoordinate2DMake(46.29395521193171, 11.71022783871709);
    points[32] = CLLocationCoordinate2DMake(46.27862530050653, 11.72510698367439);
    points[33] = CLLocationCoordinate2DMake(46.26598047887871, 11.72859065204071);
    points[34] = CLLocationCoordinate2DMake(46.26143365373412, 11.71756822172234);
    points[35] = CLLocationCoordinate2DMake(46.26290159590749, 11.69057418803241);
    points[36] = CLLocationCoordinate2DMake(46.25683258453999, 11.67739938241076);
    points[37] = CLLocationCoordinate2DMake(46.25732968373556, 11.6454107524317);
    points[38] = CLLocationCoordinate2DMake(46.26125707904549, 11.62442972494524);
    points[39] = CLLocationCoordinate2DMake(46.23603159769874, 11.60041618151515);
    points[40] = CLLocationCoordinate2DMake(46.21542901058046, 11.63059194545013);
    points[41] = CLLocationCoordinate2DMake(46.21008621501066, 11.64751625600297);
    points[42] = CLLocationCoordinate2DMake(46.17956716786278, 11.63703774373627);
    points[43] = CLLocationCoordinate2DMake(46.16132391971774, 11.67158452134401);
    points[44] = CLLocationCoordinate2DMake(46.17509189259495, 11.69433829980698);
    points[45] = CLLocationCoordinate2DMake(46.16864756223515, 11.70329314399799);
    points[46] = CLLocationCoordinate2DMake(46.16334734296996, 11.69412901247347);
    points[47] = CLLocationCoordinate2DMake(46.14052765250307, 11.7172376286949);
    points[48] = CLLocationCoordinate2DMake(46.1408758289335, 11.73073497221442);
    points[49] = CLLocationCoordinate2DMake(46.09630670498424, 11.7550384157116);
    
    MKPolygon *polygon = [MKPolygon polygonWithCoordinates:points count:50];
    polygon.title = @"C2";
    
    return polygon;
}
+ (MKPolygon *) polygonForC3 {
    CLLocationCoordinate2D points[54];
    
    points[0] = CLLocationCoordinate2DMake(45.97966501817795, 11.3747435645524);
    points[1] = CLLocationCoordinate2DMake(45.98275220720242, 11.40699199619817);
    points[2] = CLLocationCoordinate2DMake(45.98112797554788, 11.45156146918836);
    points[3] = CLLocationCoordinate2DMake(46.00782157132707, 11.48875723923659);
    points[4] = CLLocationCoordinate2DMake(46.0119495478237, 11.54196606438476);
    points[5] = CLLocationCoordinate2DMake(46.0054874958305, 11.57631249469758);
    points[6] = CLLocationCoordinate2DMake(45.96931779903901, 11.58725209833382);
    points[7] = CLLocationCoordinate2DMake(45.96172070132782, 11.62796960502434);
    points[8] = CLLocationCoordinate2DMake(45.97151585077715, 11.68725563803335);
    points[9] = CLLocationCoordinate2DMake(45.98982467502038, 11.6878153134506);
    points[10] = CLLocationCoordinate2DMake(46.01610370534306, 11.66517847078751);
    points[11] = CLLocationCoordinate2DMake(46.04077138363534, 11.67063521664016);
    points[12] = CLLocationCoordinate2DMake(46.04506507892207, 11.7048896074547);
    points[13] = CLLocationCoordinate2DMake(46.08353261163602, 11.68417039120477);
    points[14] = CLLocationCoordinate2DMake(46.10219890648699, 11.71895863170355);
    points[15] = CLLocationCoordinate2DMake(46.09630670498424, 11.7550384157116);
    points[16] = CLLocationCoordinate2DMake(46.1408758289335, 11.73073497221442);
    points[17] = CLLocationCoordinate2DMake(46.14052765250307, 11.7172376286949);
    points[18] = CLLocationCoordinate2DMake(46.16334734296996, 11.69412901247347);
    points[19] = CLLocationCoordinate2DMake(46.16864756223515, 11.70329314399799);
    points[20] = CLLocationCoordinate2DMake(46.17509189259495, 11.69433829980698);
    points[21] = CLLocationCoordinate2DMake(46.16132391971774, 11.67158452134401);
    points[22] = CLLocationCoordinate2DMake(46.17956716786278, 11.63703774373627);
    points[23] = CLLocationCoordinate2DMake(46.21008621501066, 11.64751625600297);
    points[24] = CLLocationCoordinate2DMake(46.21542901058046, 11.63059194545013);
    points[25] = CLLocationCoordinate2DMake(46.23603159769874, 11.60041618151515);
    points[26] = CLLocationCoordinate2DMake(46.22583885189157, 11.59013747156864);
    points[27] = CLLocationCoordinate2DMake(46.21999650100141, 11.57477525833323);
    points[28] = CLLocationCoordinate2DMake(46.22150426049978, 11.56279927801886);
    points[29] = CLLocationCoordinate2DMake(46.21240650401344, 11.53626791376113);
    points[30] = CLLocationCoordinate2DMake(46.20335907050169, 11.534996122009);
    points[31] = CLLocationCoordinate2DMake(46.2008155618669, 11.51362340764425);
    points[32] = CLLocationCoordinate2DMake(46.18388897625341, 11.49857069837766);
    points[33] = CLLocationCoordinate2DMake(46.17186645571648, 11.45879256600789);
    points[34] = CLLocationCoordinate2DMake(46.17663140816128, 11.44425967278968);
    points[35] = CLLocationCoordinate2DMake(46.1694065180197, 11.42376061414714);
    points[36] = CLLocationCoordinate2DMake(46.16553743637402, 11.421803665758);
    points[37] = CLLocationCoordinate2DMake(46.16305439259165, 11.40734182711131);
    points[38] = CLLocationCoordinate2DMake(46.16820944853771, 11.39740822587245);
    points[39] = CLLocationCoordinate2DMake(46.15804421372162, 11.37485786627645);
    points[40] = CLLocationCoordinate2DMake(46.13775956011811, 11.39138944386085);
    points[41] = CLLocationCoordinate2DMake(46.13447075182867, 11.40560393276212);
    points[42] = CLLocationCoordinate2DMake(46.12099756193753, 11.40306583901358);
    points[43] = CLLocationCoordinate2DMake(46.09392765139766, 11.37170172562572);
    points[44] = CLLocationCoordinate2DMake(46.09604582016679, 11.36300509453531);
    points[45] = CLLocationCoordinate2DMake(46.08006976616937, 11.35744777940352);
    points[46] = CLLocationCoordinate2DMake(46.06345368729254, 11.34527831919715);
    points[47] = CLLocationCoordinate2DMake(46.05071439197573, 11.33819293024616);
    points[48] = CLLocationCoordinate2DMake(46.04746341674462, 11.35276046660272);
    points[49] = CLLocationCoordinate2DMake(46.03327500678763, 11.35477463322692);
    points[50] = CLLocationCoordinate2DMake(46.02417426295323, 11.36178958069372);
    points[51] = CLLocationCoordinate2DMake(46.00789010477132, 11.36935823443961);
    points[52] = CLLocationCoordinate2DMake(46.00168629336888, 11.36463244921345);
    points[53] = CLLocationCoordinate2DMake(45.97966501817795, 11.3747435645524);
    
    MKPolygon *polygon = [MKPolygon polygonWithCoordinates:points count:54];
    polygon.title = @"C3";
    
    return polygon;
}
+ (MKPolygon *) polygonForC4 {
    CLLocationCoordinate2D points[55];
    
    points[0] = CLLocationCoordinate2DMake(45.91704244199207, 11.25998460320803);
    points[1] = CLLocationCoordinate2DMake(45.93076812660122, 11.30542899476987);
    points[2] = CLLocationCoordinate2DMake(45.91058574766978, 11.34699486407231);
    points[3] = CLLocationCoordinate2DMake(45.92914741406594, 11.35637129446699);
    points[4] = CLLocationCoordinate2DMake(45.94696756901318, 11.38347815110396);
    points[5] = CLLocationCoordinate2DMake(45.97966501817795, 11.3747435645524);
    points[6] = CLLocationCoordinate2DMake(46.03327500678763, 11.35477463322692);
    points[7] = CLLocationCoordinate2DMake(46.04746341674462, 11.35276046660272);
    points[8] = CLLocationCoordinate2DMake(46.05071439197573, 11.33819293024616);
    points[9] = CLLocationCoordinate2DMake(46.06345368729254, 11.34527831919715);
    points[10] = CLLocationCoordinate2DMake(46.08006976616937, 11.35744777940352);
    points[11] = CLLocationCoordinate2DMake(46.09604582016679, 11.36300509453531);
    points[12] = CLLocationCoordinate2DMake(46.09392765139766, 11.37170172562572);
    points[13] = CLLocationCoordinate2DMake(46.12099756193753, 11.40306583901358);
    points[14] = CLLocationCoordinate2DMake(46.13447075182867, 11.40560393276212);
    points[15] = CLLocationCoordinate2DMake(46.13775956011811, 11.39138944386085);
    points[16] = CLLocationCoordinate2DMake(46.15804421372162, 11.37485786627645);
    points[17] = CLLocationCoordinate2DMake(46.16820944853771, 11.39740822587245);
    points[18] = CLLocationCoordinate2DMake(46.17608535406345, 11.38480063238779);
    points[19] = CLLocationCoordinate2DMake(46.18511527808606, 11.38452956604783);
    points[20] = CLLocationCoordinate2DMake(46.18614389535001, 11.34718408215813);
    points[21] = CLLocationCoordinate2DMake(46.1952729327093, 11.36190906416373);
    points[22] = CLLocationCoordinate2DMake(46.2028415623388, 11.35775399826451);
    points[23] = CLLocationCoordinate2DMake(46.19723389866951, 11.32841592278407);
    points[24] = CLLocationCoordinate2DMake(46.17966846408901, 11.29925685735205);
    points[25] = CLLocationCoordinate2DMake(46.17109865932959, 11.28807269920087);
    points[26] = CLLocationCoordinate2DMake(46.17188017371419, 11.26975128519176);
    points[27] = CLLocationCoordinate2DMake(46.16478351224197, 11.25884635582484);
    points[28] = CLLocationCoordinate2DMake(46.15236779581041, 11.23796735607042);
    points[29] = CLLocationCoordinate2DMake(46.13157536501065, 11.22822966108565);
    points[30] = CLLocationCoordinate2DMake(46.14380110565263, 11.21001783055871);
    points[31] = CLLocationCoordinate2DMake(46.12695188084785, 11.19184970859096);
    points[32] = CLLocationCoordinate2DMake(46.12595935247707, 11.16959410144457);
    points[33] = CLLocationCoordinate2DMake(46.10690616512352, 11.15488114790737);
    points[34] = CLLocationCoordinate2DMake(46.09617272523955, 11.15940112288437);
    points[35] = CLLocationCoordinate2DMake(46.08379473881054, 11.17712953142445);
    points[36] = CLLocationCoordinate2DMake(46.06397863117837, 11.19705908147756);
    points[37] = CLLocationCoordinate2DMake(46.04352693993167, 11.1924767317738);
    points[38] = CLLocationCoordinate2DMake(46.02539085343653, 11.18587313587897);
    points[39] = CLLocationCoordinate2DMake(46.02202573063722, 11.16688506761888);
    points[40] = CLLocationCoordinate2DMake(46.01511546961601, 11.16140286174802);
    points[41] = CLLocationCoordinate2DMake(46.00289576954869, 11.16456919750668);
    points[42] = CLLocationCoordinate2DMake(45.98183732552548, 11.16322015360871);
    points[43] = CLLocationCoordinate2DMake(45.97314770940395, 11.16854459307036);
    points[44] = CLLocationCoordinate2DMake(45.9698356721517, 11.184491786487);
    points[45] = CLLocationCoordinate2DMake(45.96445845656947, 11.19611754926932);
    points[46] = CLLocationCoordinate2DMake(45.95431849626704, 11.18554396808735);
    points[47] = CLLocationCoordinate2DMake(45.9400326830007, 11.19355962887459);
    points[48] = CLLocationCoordinate2DMake(45.94803676290564, 11.21409604810991);
    points[49] = CLLocationCoordinate2DMake(45.94651166926987, 11.22571976382162);
    points[50] = CLLocationCoordinate2DMake(45.95659417577441, 11.23672790459071);
    points[51] = CLLocationCoordinate2DMake(45.95592381334419, 11.24322730623565);
    points[52] = CLLocationCoordinate2DMake(45.94272819386512, 11.2467028168838);
    points[53] = CLLocationCoordinate2DMake(45.92898706131515, 11.26853407043494);
    points[54] = CLLocationCoordinate2DMake(45.91704244199207, 11.25998460320803);
    
    MKPolygon *polygon = [MKPolygon polygonWithCoordinates:points count:55];
    polygon.title = @"C4";
    
    return polygon;
}
+ (MKPolygon *) polygonForC5 {
    CLLocationCoordinate2D points[94];
    
    points[0] = CLLocationCoordinate2DMake(46.03690420677557, 10.94210511193322);
    points[1] = CLLocationCoordinate2DMake(46.03249412301199, 10.95898638134063);
    points[2] = CLLocationCoordinate2DMake(46.02281492787021, 10.94979192300276);
    points[3] = CLLocationCoordinate2DMake(46.01824199831457, 10.95968523505969);
    points[4] = CLLocationCoordinate2DMake(45.99307277520998, 10.9441834398502);
    points[5] = CLLocationCoordinate2DMake(45.97927163259619, 10.95390179553304);
    points[6] = CLLocationCoordinate2DMake(45.97622136946308, 10.94950403413755);
    points[7] = CLLocationCoordinate2DMake(45.96682615602169, 10.97034839210759);
    points[8] = CLLocationCoordinate2DMake(45.94311524716646, 10.9902933374303);
    points[9] = CLLocationCoordinate2DMake(45.95003999059131, 11.00179167825346);
    points[10] = CLLocationCoordinate2DMake(45.96589257912972, 11.0119973258969);
    points[11] = CLLocationCoordinate2DMake(45.98233494686893, 11.03796597464925);
    points[12] = CLLocationCoordinate2DMake(45.9709991612841, 11.04973414752352);
    points[13] = CLLocationCoordinate2DMake(45.9640061285065, 11.05234635520864);
    points[14] = CLLocationCoordinate2DMake(45.95845486962169, 11.04498878212063);
    points[15] = CLLocationCoordinate2DMake(45.9584953031429, 11.055720032411);
    points[16] = CLLocationCoordinate2DMake(45.96561278217862, 11.07127973455692);
    points[17] = CLLocationCoordinate2DMake(45.95494893533581, 11.07640002158699);
    points[18] = CLLocationCoordinate2DMake(45.95455185981088, 11.09563635199402);
    points[19] = CLLocationCoordinate2DMake(45.96190230775616, 11.10730578418809);
    points[20] = CLLocationCoordinate2DMake(45.98150916568432, 11.11144899426334);
    points[21] = CLLocationCoordinate2DMake(45.98538501439657, 11.12568001026264);
    points[22] = CLLocationCoordinate2DMake(45.97699237774499, 11.13697486096143);
    points[23] = CLLocationCoordinate2DMake(45.98183732552548, 11.16322015360871);
    points[24] = CLLocationCoordinate2DMake(46.00289576954869, 11.16456919750668);
    points[25] = CLLocationCoordinate2DMake(46.01511546961601, 11.16140286174802);
    points[26] = CLLocationCoordinate2DMake(46.02202573063722, 11.16688506761888);
    points[27] = CLLocationCoordinate2DMake(46.02539085343653, 11.18587313587897);
    points[28] = CLLocationCoordinate2DMake(46.04352693993167, 11.1924767317738);
    points[29] = CLLocationCoordinate2DMake(46.06397863117837, 11.19705908147756);
    points[30] = CLLocationCoordinate2DMake(46.08379473881054, 11.17712953142445);
    points[31] = CLLocationCoordinate2DMake(46.09617272523955, 11.15940112288437);
    points[32] = CLLocationCoordinate2DMake(46.10690616512352, 11.15488114790737);
    points[33] = CLLocationCoordinate2DMake(46.12595935247707, 11.16959410144457);
    points[34] = CLLocationCoordinate2DMake(46.12695188084785, 11.19184970859096);
    points[35] = CLLocationCoordinate2DMake(46.14380110565263, 11.21001783055871);
    points[36] = CLLocationCoordinate2DMake(46.13157536501065, 11.22822966108565);
    points[37] = CLLocationCoordinate2DMake(46.15236779581041, 11.23796735607042);
    points[38] = CLLocationCoordinate2DMake(46.16478351224197, 11.25884635582484);
    points[39] = CLLocationCoordinate2DMake(46.17188017371419, 11.26975128519176);
    points[40] = CLLocationCoordinate2DMake(46.17109865932959, 11.28807269920087);
    points[41] = CLLocationCoordinate2DMake(46.17966846408901, 11.29925685735205);
    points[42] = CLLocationCoordinate2DMake(46.19723389866951, 11.32841592278407);
    points[43] = CLLocationCoordinate2DMake(46.2028415623388, 11.35775399826451);
    points[44] = CLLocationCoordinate2DMake(46.2020448807413, 11.36515622721326);
    points[45] = CLLocationCoordinate2DMake(46.21970867103206, 11.36174108849776);
    points[46] = CLLocationCoordinate2DMake(46.22416788563811, 11.35365581242408);
    points[47] = CLLocationCoordinate2DMake(46.22018470671196, 11.35008164069356);
    points[48] = CLLocationCoordinate2DMake(46.23948528946971, 11.3400590967341);
    points[49] = CLLocationCoordinate2DMake(46.25081677695238, 11.33046075365589);
    points[50] = CLLocationCoordinate2DMake(46.24447638451937, 11.32409605368119);
    points[51] = CLLocationCoordinate2DMake(46.26250203532276, 11.31127348798656);
    points[52] = CLLocationCoordinate2DMake(46.26113014589664, 11.29559782989726);
    points[53] = CLLocationCoordinate2DMake(46.22203315423874, 11.21252877533325);
    points[54] = CLLocationCoordinate2DMake(46.2332133723241, 11.17684589895494);
    points[55] = CLLocationCoordinate2DMake(46.25519449613832, 11.20446894934443);
    points[56] = CLLocationCoordinate2DMake(46.28259202284713, 11.14135161336903);
    points[57] = CLLocationCoordinate2DMake(46.25941185825484, 11.13595140931835);
    points[58] = CLLocationCoordinate2DMake(46.24340433723558, 11.12219268938809);
    points[59] = CLLocationCoordinate2DMake(46.24126265889351, 11.09927413452687);
    points[60] = CLLocationCoordinate2DMake(46.23191522912129, 11.07536430603591);
    points[61] = CLLocationCoordinate2DMake(46.23715179698908, 11.0616018096662);
    points[62] = CLLocationCoordinate2DMake(46.22571224630563, 11.03841605348441);
    points[63] = CLLocationCoordinate2DMake(46.22568373357257, 11.02908514794573);
    points[64] = CLLocationCoordinate2DMake(46.21890202456184, 11.03557169419066);
    points[65] = CLLocationCoordinate2DMake(46.2057226096111, 11.00076072491902);
    points[66] = CLLocationCoordinate2DMake(46.21001407897163, 10.99741347636721);
    points[67] = CLLocationCoordinate2DMake(46.20325755684144, 10.97406289600533);
    points[68] = CLLocationCoordinate2DMake(46.21635873631242, 10.96871488554195);
    points[69] = CLLocationCoordinate2DMake(46.21314340058881, 10.95465107450683);
    points[70] = CLLocationCoordinate2DMake(46.20520951655988, 10.9554957082378);
    points[71] = CLLocationCoordinate2DMake(46.19684333949954, 10.93716205081647);
    points[72] = CLLocationCoordinate2DMake(46.1885793868784, 10.92420096452784);
    points[73] = CLLocationCoordinate2DMake(46.18802886914824, 10.90498781388004);
    points[74] = CLLocationCoordinate2DMake(46.18150097392709, 10.90091115650281);
    points[75] = CLLocationCoordinate2DMake(46.15622584804353, 10.89442004765882);
    points[76] = CLLocationCoordinate2DMake(46.14932693070706, 10.92312841137449);
    points[77] = CLLocationCoordinate2DMake(46.14305969765961, 10.9256736175357);
    points[78] = CLLocationCoordinate2DMake(46.13793290801095, 10.93062048160402);
    points[79] = CLLocationCoordinate2DMake(46.14645959276001, 10.93154291745898);
    points[80] = CLLocationCoordinate2DMake(46.14040650540213, 10.95458616610845);
    points[81] = CLLocationCoordinate2DMake(46.13553844395437, 10.95891230804767);
    points[82] = CLLocationCoordinate2DMake(46.12632091455144, 10.95975450992025);
    points[83] = CLLocationCoordinate2DMake(46.11328010324863, 10.94269099410767);
    points[84] = CLLocationCoordinate2DMake(46.10811302706643, 10.94621814478904);
    points[85] = CLLocationCoordinate2DMake(46.11597170399157, 10.9629703988149);
    points[86] = CLLocationCoordinate2DMake(46.11366219572476, 10.97005436364695);
    points[87] = CLLocationCoordinate2DMake(46.09623236001887, 10.96770638465395);
    points[88] = CLLocationCoordinate2DMake(46.09605612686782, 10.9593527826031);
    points[89] = CLLocationCoordinate2DMake(46.07717394220234, 10.9510151093174);
    points[90] = CLLocationCoordinate2DMake(46.06582316165559, 10.93317223208204);
    points[91] = CLLocationCoordinate2DMake(46.05310462017149, 10.9273958634471);
    points[92] = CLLocationCoordinate2DMake(46.04785149051801, 10.94034653174926);
    points[93] = CLLocationCoordinate2DMake(46.03690420677557, 10.94210511193322);
    
    MKPolygon *polygon = [MKPolygon polygonWithCoordinates:points count:94];
    polygon.title = @"C5";
    
    return polygon;
}
+ (MKPolygon *) polygonForC6 {
    CLLocationCoordinate2D points[50];
    
    points[0] = CLLocationCoordinate2DMake(46.18802886914824, 10.90498781388004);
    points[1] = CLLocationCoordinate2DMake(46.1885793868784, 10.92420096452784);
    points[2] = CLLocationCoordinate2DMake(46.19684333949954, 10.93716205081647);
    points[3] = CLLocationCoordinate2DMake(46.20520951655988, 10.9554957082378);
    points[4] = CLLocationCoordinate2DMake(46.21314340058881, 10.95465107450683);
    points[5] = CLLocationCoordinate2DMake(46.21635873631242, 10.96871488554195);
    points[6] = CLLocationCoordinate2DMake(46.20325755684144, 10.97406289600533);
    points[7] = CLLocationCoordinate2DMake(46.21001407897163, 10.99741347636721);
    points[8] = CLLocationCoordinate2DMake(46.2057226096111, 11.00076072491902);
    points[9] = CLLocationCoordinate2DMake(46.21890202456184, 11.03557169419066);
    points[10] = CLLocationCoordinate2DMake(46.22568373357257, 11.02908514794573);
    points[11] = CLLocationCoordinate2DMake(46.22571224630563, 11.03841605348441);
    points[12] = CLLocationCoordinate2DMake(46.23715179698908, 11.0616018096662);
    points[13] = CLLocationCoordinate2DMake(46.23191522912129, 11.07536430603591);
    points[14] = CLLocationCoordinate2DMake(46.24126265889351, 11.09927413452687);
    points[15] = CLLocationCoordinate2DMake(46.24340433723558, 11.12219268938809);
    points[16] = CLLocationCoordinate2DMake(46.25941185825484, 11.13595140931835);
    points[17] = CLLocationCoordinate2DMake(46.28259202284713, 11.14135161336903);
    points[18] = CLLocationCoordinate2DMake(46.29175012970022, 11.16535288143488);
    points[19] = CLLocationCoordinate2DMake(46.34425302806304, 11.20394463768852);
    points[20] = CLLocationCoordinate2DMake(46.36348249130425, 11.19119954023149);
    points[21] = CLLocationCoordinate2DMake(46.39551361985473, 11.21856748591355);
    points[22] = CLLocationCoordinate2DMake(46.4305116305794, 11.20721242020988);
    points[23] = CLLocationCoordinate2DMake(46.46209527131753, 11.22413960629216);
    points[24] = CLLocationCoordinate2DMake(46.50978651188545, 11.18611932198012);
    points[25] = CLLocationCoordinate2DMake(46.47882909117005, 11.13049902567897);
    points[26] = CLLocationCoordinate2DMake(46.50230010010886, 11.0913040552447);
    points[27] = CLLocationCoordinate2DMake(46.53238949375925, 11.0835426105963);
    points[28] = CLLocationCoordinate2DMake(46.5147294581402, 11.03411355723734);
    points[29] = CLLocationCoordinate2DMake(46.48845895619636, 11.06105270038176);
    points[30] = CLLocationCoordinate2DMake(46.43904662870316, 11.07357712826236);
    points[31] = CLLocationCoordinate2DMake(46.44773027488585, 11.04031972546515);
    points[32] = CLLocationCoordinate2DMake(46.48240344701908, 10.99089449486585);
    points[33] = CLLocationCoordinate2DMake(46.48162702948758, 10.96670975100964);
    points[34] = CLLocationCoordinate2DMake(46.44560678989434, 10.91134679697809);
    points[35] = CLLocationCoordinate2DMake(46.43896712812239, 10.86527026603667);
    points[36] = CLLocationCoordinate2DMake(46.42290249323068, 10.86295402922054);
    points[37] = CLLocationCoordinate2DMake(46.41778950080332, 10.88475247206166);
    points[38] = CLLocationCoordinate2DMake(46.40325531713849, 10.89630781428152);
    points[39] = CLLocationCoordinate2DMake(46.38900796564979, 10.92104875711281);
    points[40] = CLLocationCoordinate2DMake(46.39782686192555, 10.97093202294537);
    points[41] = CLLocationCoordinate2DMake(46.38789106012037, 11.00459912609326);
    points[42] = CLLocationCoordinate2DMake(46.37014785022926, 10.99603172917694);
    points[43] = CLLocationCoordinate2DMake(46.36793741008392, 10.98196824713944);
    points[44] = CLLocationCoordinate2DMake(46.33122366187466, 10.95991748250888);
    points[45] = CLLocationCoordinate2DMake(46.32261232897615, 10.92454734636014);
    points[46] = CLLocationCoordinate2DMake(46.24408103198531, 10.89040094090749);
    points[47] = CLLocationCoordinate2DMake(46.22787577266477, 10.90293444162396);
    points[48] = CLLocationCoordinate2DMake(46.20466336655019, 10.90280842488867);
    points[49] = CLLocationCoordinate2DMake(46.18802886914824, 10.90498781388004);
    
    MKPolygon *polygon = [MKPolygon polygonWithCoordinates:points count:50];
    polygon.title = @"C6";
    
    return polygon;
}
+ (MKPolygon *) polygonForC7 {
    CLLocationCoordinate2D points[37];
    
    points[0] = CLLocationCoordinate2DMake(46.22192179803158, 10.57488289438575);
    points[1] = CLLocationCoordinate2DMake(46.22466276017807, 10.61329902395356);
    points[2] = CLLocationCoordinate2DMake(46.21679955714869, 10.65106557538911);
    points[3] = CLLocationCoordinate2DMake(46.23957397369208, 10.68695077919809);
    points[4] = CLLocationCoordinate2DMake(46.23770884521451, 10.73509472055456);
    points[5] = CLLocationCoordinate2DMake(46.25494767560191, 10.7884422417409);
    points[6] = CLLocationCoordinate2DMake(46.27536248926, 10.81849445069394);
    points[7] = CLLocationCoordinate2DMake(46.26860701116122, 10.86930080521704);
    points[8] = CLLocationCoordinate2DMake(46.24408103198531, 10.89040094090749);
    points[9] = CLLocationCoordinate2DMake(46.32261232897615, 10.92454734636014);
    points[10] = CLLocationCoordinate2DMake(46.33122366187466, 10.95991748250888);
    points[11] = CLLocationCoordinate2DMake(46.36793741008392, 10.98196824713944);
    points[12] = CLLocationCoordinate2DMake(46.37014785022926, 10.99603172917694);
    points[13] = CLLocationCoordinate2DMake(46.38789106012037, 11.00459912609326);
    points[14] = CLLocationCoordinate2DMake(46.39782686192555, 10.97093202294537);
    points[15] = CLLocationCoordinate2DMake(46.38900796564979, 10.92104875711281);
    points[16] = CLLocationCoordinate2DMake(46.40325531713849, 10.89630781428152);
    points[17] = CLLocationCoordinate2DMake(46.41778950080332, 10.88475247206166);
    points[18] = CLLocationCoordinate2DMake(46.42290249323068, 10.86295402922054);
    points[19] = CLLocationCoordinate2DMake(46.43896712812239, 10.86527026603667);
    points[20] = CLLocationCoordinate2DMake(46.44384191131395, 10.79967064739174);
    points[21] = CLLocationCoordinate2DMake(46.48587702392249, 10.7642480410158);
    points[22] = CLLocationCoordinate2DMake(46.48681997439434, 10.74682684955322);
    points[23] = CLLocationCoordinate2DMake(46.45171268359601, 10.68266264406242);
    points[24] = CLLocationCoordinate2DMake(46.44620037636397, 10.6202102959552);
    points[25] = CLLocationCoordinate2DMake(46.43062128326596, 10.61198581841135);
    points[26] = CLLocationCoordinate2DMake(46.40474271422979, 10.62659035564544);
    points[27] = CLLocationCoordinate2DMake(46.37697645040831, 10.6055401569514);
    points[28] = CLLocationCoordinate2DMake(46.37565951347676, 10.56268397236707);
    points[29] = CLLocationCoordinate2DMake(46.3527959242154, 10.50833693323615);
    points[30] = CLLocationCoordinate2DMake(46.32470956005713, 10.56730636449965);
    points[31] = CLLocationCoordinate2DMake(46.30243365467479, 10.57983724151116);
    points[32] = CLLocationCoordinate2DMake(46.28165299517324, 10.56145737504934);
    points[33] = CLLocationCoordinate2DMake(46.27133389385638, 10.57713743342597);
    points[34] = CLLocationCoordinate2DMake(46.2474259264259, 10.5813011965695);
    points[35] = CLLocationCoordinate2DMake(46.22228188614209, 10.56905780188251);
    points[36] = CLLocationCoordinate2DMake(46.22192179803158, 10.57488289438575);
    
    MKPolygon *polygon = [MKPolygon polygonWithCoordinates:points count:37];
    polygon.title = @"C7";
    
    return polygon;
}
+ (MKPolygon *) polygonForC8 {
    CLLocationCoordinate2D points[90];
    
    points[0] = CLLocationCoordinate2DMake(45.80225581871769, 10.64204401892656);
    points[1] = CLLocationCoordinate2DMake(45.81378281460974, 10.63120483552998);
    points[2] = CLLocationCoordinate2DMake(45.82593220453197, 10.63950129153712);
    points[3] = CLLocationCoordinate2DMake(45.83336800228764, 10.63942122626776);
    points[4] = CLLocationCoordinate2DMake(45.83555413058156, 10.63109428837677);
    points[5] = CLLocationCoordinate2DMake(45.83934395324889, 10.63717100273435);
    points[6] = CLLocationCoordinate2DMake(45.84782476382762, 10.6325367759918);
    points[7] = CLLocationCoordinate2DMake(45.85552341652024, 10.62236936633216);
    points[8] = CLLocationCoordinate2DMake(45.8625392303238, 10.61854412590389);
    points[9] = CLLocationCoordinate2DMake(45.86975683628901, 10.61004341911407);
    points[10] = CLLocationCoordinate2DMake(45.88142712164064, 10.62825435225944);
    points[11] = CLLocationCoordinate2DMake(45.89144060956013, 10.62222288209996);
    points[12] = CLLocationCoordinate2DMake(45.89749222839318, 10.63166023208007);
    points[13] = CLLocationCoordinate2DMake(45.91151874783876, 10.64705093968328);
    points[14] = CLLocationCoordinate2DMake(45.92064766657505, 10.65961601930755);
    points[15] = CLLocationCoordinate2DMake(45.93319182628355, 10.67806797572334);
    points[16] = CLLocationCoordinate2DMake(45.94074910888843, 10.69425406329855);
    points[17] = CLLocationCoordinate2DMake(45.93980254110065, 10.70141683216075);
    points[18] = CLLocationCoordinate2DMake(45.95643892356127, 10.7106024454783);
    points[19] = CLLocationCoordinate2DMake(45.95662824630558, 10.71899541071535);
    points[20] = CLLocationCoordinate2DMake(45.96420533371749, 10.72679495975605);
    points[21] = CLLocationCoordinate2DMake(45.97026885802857, 10.75387111329724);
    points[22] = CLLocationCoordinate2DMake(45.9623004516308, 10.78572583853585);
    points[23] = CLLocationCoordinate2DMake(45.96085572812329, 10.81473103576578);
    points[24] = CLLocationCoordinate2DMake(45.96081083698318, 10.83682796708917);
    points[25] = CLLocationCoordinate2DMake(45.95612181000882, 10.84210162859317);
    points[26] = CLLocationCoordinate2DMake(45.95515081732491, 10.86222491387244);
    points[27] = CLLocationCoordinate2DMake(45.97208888720052, 10.87245416132817);
    points[28] = CLLocationCoordinate2DMake(45.97726522836274, 10.88856320799525);
    points[29] = CLLocationCoordinate2DMake(45.99105417943719, 10.89391892464615);
    points[30] = CLLocationCoordinate2DMake(45.98778878889757, 10.9008872467732);
    points[31] = CLLocationCoordinate2DMake(46.01086410417146, 10.91457998132071);
    points[32] = CLLocationCoordinate2DMake(46.02444066694947, 10.91737482422236);
    points[33] = CLLocationCoordinate2DMake(46.02888356425589, 10.93126561272251);
    points[34] = CLLocationCoordinate2DMake(46.03323962396789, 10.93016404054393);
    points[35] = CLLocationCoordinate2DMake(46.03690420677557, 10.94210511193322);
    points[36] = CLLocationCoordinate2DMake(46.04785149051801, 10.94034653174926);
    points[37] = CLLocationCoordinate2DMake(46.05310462017149, 10.9273958634471);
    points[38] = CLLocationCoordinate2DMake(46.06582316165559, 10.93317223208204);
    points[39] = CLLocationCoordinate2DMake(46.07717394220234, 10.9510151093174);
    points[40] = CLLocationCoordinate2DMake(46.09605612686782, 10.9593527826031);
    points[41] = CLLocationCoordinate2DMake(46.09623236001887, 10.96770638465395);
    points[42] = CLLocationCoordinate2DMake(46.11366219572476, 10.97005436364695);
    points[43] = CLLocationCoordinate2DMake(46.11597170399157, 10.9629703988149);
    points[44] = CLLocationCoordinate2DMake(46.10811302706643, 10.94621814478904);
    points[45] = CLLocationCoordinate2DMake(46.11328010324863, 10.94269099410767);
    points[46] = CLLocationCoordinate2DMake(46.12632091455144, 10.95975450992025);
    points[47] = CLLocationCoordinate2DMake(46.13553844395437, 10.95891230804767);
    points[48] = CLLocationCoordinate2DMake(46.14040650540213, 10.95458616610845);
    points[49] = CLLocationCoordinate2DMake(46.14645959276001, 10.93154291745898);
    points[50] = CLLocationCoordinate2DMake(46.13793290801095, 10.93062048160402);
    points[51] = CLLocationCoordinate2DMake(46.14305969765961, 10.9256736175357);
    points[52] = CLLocationCoordinate2DMake(46.14932693070706, 10.92312841137449);
    points[53] = CLLocationCoordinate2DMake(46.15622584804353, 10.89442004765882);
    points[54] = CLLocationCoordinate2DMake(46.18150097392709, 10.90091115650281);
    points[55] = CLLocationCoordinate2DMake(46.18802886914824, 10.90498781388004);
    points[56] = CLLocationCoordinate2DMake(46.20466336655019, 10.90280842488867);
    points[57] = CLLocationCoordinate2DMake(46.22787577266477, 10.90293444162396);
    points[58] = CLLocationCoordinate2DMake(46.24408103198531, 10.89040094090749);
    points[59] = CLLocationCoordinate2DMake(46.26860701116122, 10.86930080521704);
    points[60] = CLLocationCoordinate2DMake(46.27536248926, 10.81849445069394);
    points[61] = CLLocationCoordinate2DMake(46.25494767560191, 10.7884422417409);
    points[62] = CLLocationCoordinate2DMake(46.23770884521451, 10.73509472055456);
    points[63] = CLLocationCoordinate2DMake(46.23957397369208, 10.68695077919809);
    points[64] = CLLocationCoordinate2DMake(46.21679955714869, 10.65106557538911);
    points[65] = CLLocationCoordinate2DMake(46.22466276017807, 10.61329902395356);
    points[66] = CLLocationCoordinate2DMake(46.22192179803158, 10.57488289438575);
    points[67] = CLLocationCoordinate2DMake(46.22228188614209, 10.56905780188251);
    points[68] = CLLocationCoordinate2DMake(46.18973441349951, 10.54330686932116);
    points[69] = CLLocationCoordinate2DMake(46.16423551818342, 10.56985783271915);
    points[70] = CLLocationCoordinate2DMake(46.13995456162029, 10.54652194926701);
    points[71] = CLLocationCoordinate2DMake(46.10445850019916, 10.54779618340138);
    points[72] = CLLocationCoordinate2DMake(46.05526428761895, 10.4778901613061);
    points[73] = CLLocationCoordinate2DMake(46.01957719201528, 10.48126072223076);
    points[74] = CLLocationCoordinate2DMake(46.0133443231395, 10.45769212832489);
    points[75] = CLLocationCoordinate2DMake(45.98451264834042, 10.4543361775193);
    points[76] = CLLocationCoordinate2DMake(45.96898709922635, 10.48818920038718);
    points[77] = CLLocationCoordinate2DMake(45.93199102796574, 10.49855063821323);
    points[78] = CLLocationCoordinate2DMake(45.92050987655561, 10.50705587910027);
    points[79] = CLLocationCoordinate2DMake(45.89934610389144, 10.49418685627296);
    points[80] = CLLocationCoordinate2DMake(45.88298807395991, 10.49120005847007);
    points[81] = CLLocationCoordinate2DMake(45.86921220641902, 10.50314560270342);
    points[82] = CLLocationCoordinate2DMake(45.82492976924165, 10.50262770421252);
    points[83] = CLLocationCoordinate2DMake(45.82323416353802, 10.52956316288698);
    points[84] = CLLocationCoordinate2DMake(45.81774420191431, 10.54316493672464);
    points[85] = CLLocationCoordinate2DMake(45.80802662095618, 10.52501477633486);
    points[86] = CLLocationCoordinate2DMake(45.787368835256, 10.53574794402826);
    points[87] = CLLocationCoordinate2DMake(45.78453102394072, 10.56754758462766);
    points[88] = CLLocationCoordinate2DMake(45.8060633173279, 10.61651525944038);
    points[89] = CLLocationCoordinate2DMake(45.80225581871769, 10.64204401892656);
    
    MKPolygon *polygon = [MKPolygon polygonWithCoordinates:points count:90];
    polygon.title = @"C8";
    
    return polygon;
}
+ (MKPolygon *) polygonForC9 {
    CLLocationCoordinate2D points[62];
    
    points[0] = CLLocationCoordinate2DMake(45.80225581871769, 10.64204401892656);
    points[1] = CLLocationCoordinate2DMake(45.82199385289115, 10.65607032342845);
    points[2] = CLLocationCoordinate2DMake(45.83265322127443, 10.65407837074686);
    points[3] = CLLocationCoordinate2DMake(45.84032679395147, 10.70000714134293);
    points[4] = CLLocationCoordinate2DMake(45.82946974855277, 10.75453543233626);
    points[5] = CLLocationCoordinate2DMake(45.84029226849172, 10.77303498980892);
    points[6] = CLLocationCoordinate2DMake(45.83260160422927, 10.79207627229849);
    points[7] = CLLocationCoordinate2DMake(45.83697243116692, 10.82415256763873);
    points[8] = CLLocationCoordinate2DMake(45.81313480809523, 10.88703309194129);
    points[9] = CLLocationCoordinate2DMake(45.82728774348499, 10.90389059013876);
    points[10] = CLLocationCoordinate2DMake(45.82896867819596, 10.89755453561078);
    points[11] = CLLocationCoordinate2DMake(45.86615229143864, 10.91629269781725);
    points[12] = CLLocationCoordinate2DMake(45.87466434073416, 10.92100901645788);
    points[13] = CLLocationCoordinate2DMake(45.87959607987005, 10.91663980490701);
    points[14] = CLLocationCoordinate2DMake(45.8818007637006, 10.89765537010237);
    points[15] = CLLocationCoordinate2DMake(45.88833432465724, 10.91707124136181);
    points[16] = CLLocationCoordinate2DMake(45.89816611053041, 10.92656461454591);
    points[17] = CLLocationCoordinate2DMake(45.92189646764248, 10.96492919638122);
    points[18] = CLLocationCoordinate2DMake(45.94311524716646, 10.9902933374303);
    points[19] = CLLocationCoordinate2DMake(45.96682615602169, 10.97034839210759);
    points[20] = CLLocationCoordinate2DMake(45.97622136946308, 10.94950403413755);
    points[21] = CLLocationCoordinate2DMake(45.97927163259619, 10.95390179553304);
    points[22] = CLLocationCoordinate2DMake(45.99307277520998, 10.9441834398502);
    points[23] = CLLocationCoordinate2DMake(46.01824199831457, 10.95968523505969);
    points[24] = CLLocationCoordinate2DMake(46.02281492787021, 10.94979192300276);
    points[25] = CLLocationCoordinate2DMake(46.03249412301199, 10.95898638134063);
    points[26] = CLLocationCoordinate2DMake(46.03690420677557, 10.94210511193322);
    points[27] = CLLocationCoordinate2DMake(46.03323962396789, 10.93016404054393);
    points[28] = CLLocationCoordinate2DMake(46.02888356425589, 10.93126561272251);
    points[29] = CLLocationCoordinate2DMake(46.02444066694947, 10.91737482422236);
    points[30] = CLLocationCoordinate2DMake(46.01086410417146, 10.91457998132071);
    points[31] = CLLocationCoordinate2DMake(45.98778878889757, 10.9008872467732);
    points[32] = CLLocationCoordinate2DMake(45.99105417943719, 10.89391892464615);
    points[33] = CLLocationCoordinate2DMake(45.97726522836274, 10.88856320799525);
    points[34] = CLLocationCoordinate2DMake(45.97208888720052, 10.87245416132817);
    points[35] = CLLocationCoordinate2DMake(45.95515081732491, 10.86222491387244);
    points[36] = CLLocationCoordinate2DMake(45.95612181000882, 10.84210162859317);
    points[37] = CLLocationCoordinate2DMake(45.96081083698318, 10.83682796708917);
    points[38] = CLLocationCoordinate2DMake(45.96085572812329, 10.81473103576578);
    points[39] = CLLocationCoordinate2DMake(45.9623004516308, 10.78572583853585);
    points[40] = CLLocationCoordinate2DMake(45.97026885802857, 10.75387111329724);
    points[41] = CLLocationCoordinate2DMake(45.96420533371749, 10.72679495975605);
    points[42] = CLLocationCoordinate2DMake(45.95662824630558, 10.71899541071535);
    points[43] = CLLocationCoordinate2DMake(45.95643892356127, 10.7106024454783);
    points[44] = CLLocationCoordinate2DMake(45.93980254110065, 10.70141683216075);
    points[45] = CLLocationCoordinate2DMake(45.94074910888843, 10.69425406329855);
    points[46] = CLLocationCoordinate2DMake(45.93319182628355, 10.67806797572334);
    points[47] = CLLocationCoordinate2DMake(45.92064766657505, 10.65961601930755);
    points[48] = CLLocationCoordinate2DMake(45.91151874783876, 10.64705093968328);
    points[49] = CLLocationCoordinate2DMake(45.89749222839318, 10.63166023208007);
    points[50] = CLLocationCoordinate2DMake(45.89144060956013, 10.62222288209996);
    points[51] = CLLocationCoordinate2DMake(45.88142712164064, 10.62825435225944);
    points[52] = CLLocationCoordinate2DMake(45.86975683628901, 10.61004341911407);
    points[53] = CLLocationCoordinate2DMake(45.8625392303238, 10.61854412590389);
    points[54] = CLLocationCoordinate2DMake(45.85552341652024, 10.62236936633216);
    points[55] = CLLocationCoordinate2DMake(45.84782476382762, 10.6325367759918);
    points[56] = CLLocationCoordinate2DMake(45.83934395324889, 10.63717100273435);
    points[57] = CLLocationCoordinate2DMake(45.83555413058156, 10.63109428837677);
    points[58] = CLLocationCoordinate2DMake(45.83336800228764, 10.63942122626776);
    points[59] = CLLocationCoordinate2DMake(45.82593220453197, 10.63950129153712);
    points[60] = CLLocationCoordinate2DMake(45.81378281460974, 10.63120483552998);
    points[61] = CLLocationCoordinate2DMake(45.80225581871769, 10.64204401892656);
    
    MKPolygon *polygon = [MKPolygon polygonWithCoordinates:points count:62];
    polygon.title = @"C9";
    
    return polygon;
}
+ (MKPolygon *) polygonForC10 {
    CLLocationCoordinate2D points[53];
    
    points[0] = CLLocationCoordinate2DMake(45.92189646764248, 10.96492919638122);
    points[1] = CLLocationCoordinate2DMake(45.89816611053041, 10.92656461454591);
    points[2] = CLLocationCoordinate2DMake(45.88833432465724, 10.91707124136181);
    points[3] = CLLocationCoordinate2DMake(45.8818007637006, 10.89765537010237);
    points[4] = CLLocationCoordinate2DMake(45.87959607987005, 10.91663980490701);
    points[5] = CLLocationCoordinate2DMake(45.87466434073416, 10.92100901645788);
    points[6] = CLLocationCoordinate2DMake(45.86615229143864, 10.91629269781725);
    points[7] = CLLocationCoordinate2DMake(45.82896867819596, 10.89755453561078);
    points[8] = CLLocationCoordinate2DMake(45.82728774348499, 10.90389059013876);
    points[9] = CLLocationCoordinate2DMake(45.81313480809523, 10.88703309194129);
    points[10] = CLLocationCoordinate2DMake(45.77433815001805, 10.8817556510364);
    points[11] = CLLocationCoordinate2DMake(45.71841744052544, 10.84672857793134);
    points[12] = CLLocationCoordinate2DMake(45.69788182337511, 10.92603456360062);
    points[13] = CLLocationCoordinate2DMake(45.68707564472702, 10.91112381743556);
    points[14] = CLLocationCoordinate2DMake(45.67424725454914, 10.94327781700261);
    points[15] = CLLocationCoordinate2DMake(45.71888906737018, 11.01426792067904);
    points[16] = CLLocationCoordinate2DMake(45.71684894033041, 11.05716429506459);
    points[17] = CLLocationCoordinate2DMake(45.6892758218555, 11.12965065589197);
    points[18] = CLLocationCoordinate2DMake(45.73742862324124, 11.17892850608485);
    points[19] = CLLocationCoordinate2DMake(45.78467093545975, 11.17241641863744);
    points[20] = CLLocationCoordinate2DMake(45.7828653471659, 11.20290536493089);
    points[21] = CLLocationCoordinate2DMake(45.79975679947507, 11.19598930571075);
    points[22] = CLLocationCoordinate2DMake(45.81533151704383, 11.19199757160014);
    points[23] = CLLocationCoordinate2DMake(45.8553382112415, 11.2377041006964);
    points[24] = CLLocationCoordinate2DMake(45.91704244199207, 11.25998460320803);
    points[25] = CLLocationCoordinate2DMake(45.92898706131515, 11.26853407043494);
    points[26] = CLLocationCoordinate2DMake(45.94272819386512, 11.2467028168838);
    points[27] = CLLocationCoordinate2DMake(45.95592381334419, 11.24322730623565);
    points[28] = CLLocationCoordinate2DMake(45.95659417577441, 11.23672790459071);
    points[29] = CLLocationCoordinate2DMake(45.94651166926987, 11.22571976382162);
    points[30] = CLLocationCoordinate2DMake(45.94803676290564, 11.21409604810991);
    points[31] = CLLocationCoordinate2DMake(45.9400326830007, 11.19355962887459);
    points[32] = CLLocationCoordinate2DMake(45.95431849626704, 11.18554396808735);
    points[33] = CLLocationCoordinate2DMake(45.96445845656947, 11.19611754926932);
    points[34] = CLLocationCoordinate2DMake(45.9698356721517, 11.184491786487);
    points[35] = CLLocationCoordinate2DMake(45.97314770940395, 11.16854459307036);
    points[36] = CLLocationCoordinate2DMake(45.98183732552548, 11.16322015360871);
    points[37] = CLLocationCoordinate2DMake(45.97699237774499, 11.13697486096143);
    points[38] = CLLocationCoordinate2DMake(45.98538501439657, 11.12568001026264);
    points[39] = CLLocationCoordinate2DMake(45.98150916568432, 11.11144899426334);
    points[40] = CLLocationCoordinate2DMake(45.96190230775616, 11.10730578418809);
    points[41] = CLLocationCoordinate2DMake(45.95455185981088, 11.09563635199402);
    points[42] = CLLocationCoordinate2DMake(45.95494893533581, 11.07640002158699);
    points[43] = CLLocationCoordinate2DMake(45.96561278217862, 11.07127973455692);
    points[44] = CLLocationCoordinate2DMake(45.9584953031429, 11.055720032411);
    points[45] = CLLocationCoordinate2DMake(45.95845486962169, 11.04498878212063);
    points[46] = CLLocationCoordinate2DMake(45.9640061285065, 11.05234635520864);
    points[47] = CLLocationCoordinate2DMake(45.9709991612841, 11.04973414752352);
    points[48] = CLLocationCoordinate2DMake(45.98233494686893, 11.03796597464925);
    points[49] = CLLocationCoordinate2DMake(45.96589257912972, 11.0119973258969);
    points[50] = CLLocationCoordinate2DMake(45.95003999059131, 11.00179167825346);
    points[51] = CLLocationCoordinate2DMake(45.94311524716646, 10.9902933374303);
    points[52] = CLLocationCoordinate2DMake(45.92189646764248, 10.96492919638122);
    
    MKPolygon *polygon = [MKPolygon polygonWithCoordinates:points count:53];
    polygon.title = @"C10";
    
    return polygon;
}
+ (MKPolygon *) polygonForC11 {
    CLLocationCoordinate2D points[55];
    
    points[0] = CLLocationCoordinate2DMake(46.31613171394783, 11.7544211541671);
    points[1] = CLLocationCoordinate2DMake(46.32969468623793, 11.748125008216);
    points[2] = CLLocationCoordinate2DMake(46.33434987399955, 11.75345393698246);
    points[3] = CLLocationCoordinate2DMake(46.35249867879664, 11.74676246165193);
    points[4] = CLLocationCoordinate2DMake(46.35554354565583, 11.75216150030064);
    points[5] = CLLocationCoordinate2DMake(46.34928993074328, 11.75897673178718);
    points[6] = CLLocationCoordinate2DMake(46.35334089326779, 11.76665360991825);
    points[7] = CLLocationCoordinate2DMake(46.36057624323351, 11.76367902179559);
    points[8] = CLLocationCoordinate2DMake(46.35774857341755, 11.7749453945268);
    points[9] = CLLocationCoordinate2DMake(46.3662939237856, 11.79205908355984);
    points[10] = CLLocationCoordinate2DMake(46.3659299341266, 11.83421870943335);
    points[11] = CLLocationCoordinate2DMake(46.38358952591624, 11.83598008728892);
    points[12] = CLLocationCoordinate2DMake(46.40961820912992, 11.84286436206876);
    points[13] = CLLocationCoordinate2DMake(46.43364521113544, 11.85159802427022);
    points[14] = CLLocationCoordinate2DMake(46.43301814931239, 11.87041375979883);
    points[15] = CLLocationCoordinate2DMake(46.44130433046796, 11.88826570201194);
    points[16] = CLLocationCoordinate2DMake(46.46412464315617, 11.88699362718196);
    points[17] = CLLocationCoordinate2DMake(46.47204450736818, 11.87518189978553);
    points[18] = CLLocationCoordinate2DMake(46.47686181532586, 11.81366062262541);
    points[19] = CLLocationCoordinate2DMake(46.49789584445778, 11.81420787027581);
    points[20] = CLLocationCoordinate2DMake(46.50871335914902, 11.8295225809337);
    points[21] = CLLocationCoordinate2DMake(46.52079749241069, 11.82536741529504);
    points[22] = CLLocationCoordinate2DMake(46.53150000216461, 11.81079762429724);
    points[23] = CLLocationCoordinate2DMake(46.52274417611109, 11.79409469555167);
    points[24] = CLLocationCoordinate2DMake(46.51308707004737, 11.79178863032161);
    points[25] = CLLocationCoordinate2DMake(46.5050767232131, 11.74626466546684);
    points[26] = CLLocationCoordinate2DMake(46.51193292693757, 11.71474900008074);
    points[27] = CLLocationCoordinate2DMake(46.50634451727691, 11.70046544840741);
    points[28] = CLLocationCoordinate2DMake(46.49961338725856, 11.68378151314364);
    points[29] = CLLocationCoordinate2DMake(46.50224528688845, 11.63765238753261);
    points[30] = CLLocationCoordinate2DMake(46.49796016085286, 11.63176297912344);
    points[31] = CLLocationCoordinate2DMake(46.4933772387318, 11.63316441346138);
    points[32] = CLLocationCoordinate2DMake(46.48297952436697, 11.64890834518356);
    points[33] = CLLocationCoordinate2DMake(46.47318283773658, 11.64448451796397);
    points[34] = CLLocationCoordinate2DMake(46.47101312871528, 11.6263549079863);
    points[35] = CLLocationCoordinate2DMake(46.46372052476603, 11.62709495920841);
    points[36] = CLLocationCoordinate2DMake(46.44304578979126, 11.61666496345636);
    points[37] = CLLocationCoordinate2DMake(46.42664696862256, 11.62006678343181);
    points[38] = CLLocationCoordinate2DMake(46.38872708594653, 11.60133323124858);
    points[39] = CLLocationCoordinate2DMake(46.37999449928249, 11.59343252350514);
    points[40] = CLLocationCoordinate2DMake(46.36490513133619, 11.59597032404947);
    points[41] = CLLocationCoordinate2DMake(46.35042712911356, 11.62715956242776);
    points[42] = CLLocationCoordinate2DMake(46.34267245322027, 11.61678484959224);
    points[43] = CLLocationCoordinate2DMake(46.33800637460391, 11.62043725886722);
    points[44] = CLLocationCoordinate2DMake(46.34574221234678, 11.63462096280074);
    points[45] = CLLocationCoordinate2DMake(46.33714572707688, 11.64368062282012);
    points[46] = CLLocationCoordinate2DMake(46.34259937593937, 11.66358004568369);
    points[47] = CLLocationCoordinate2DMake(46.33730169233553, 11.67631644196646);
    points[48] = CLLocationCoordinate2DMake(46.34460871661233, 11.69077866889531);
    points[49] = CLLocationCoordinate2DMake(46.34483746489953, 11.70142546205253);
    points[50] = CLLocationCoordinate2DMake(46.32521166989613, 11.7116034355368);
    points[51] = CLLocationCoordinate2DMake(46.31801828471671, 11.72554999099652);
    points[52] = CLLocationCoordinate2DMake(46.321500413027, 11.74040301426689);
    points[53] = CLLocationCoordinate2DMake(46.31165368289166, 11.74064282631183);
    points[54] = CLLocationCoordinate2DMake(46.31613171394783, 11.7544211541671);
    
    MKPolygon *polygon = [MKPolygon polygonWithCoordinates:points count:55];
    polygon.title = @"C11";
    
    return polygon;
}
@end
