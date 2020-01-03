unit Constants;

{$mode objfpc}

interface

uses
  fgl, LMessages;

type
  TNoteMap = specialize TFPGMap<Integer, String>;
  TNoteToCodeMap = specialize TFPGMap<String, Integer>;
  TKeybindings = specialize TFPGmap<Word, Integer>;
  TNoteToFreqMap = specialize TFPGMap<Integer, Integer>;

const
  UGE_FORMAT_VERSION = 1;

  LM_FD = LM_USER + 0;
  LM_UNDO_OCCURED = LM_USER + 1;
  LM_PREVIEW_NOTE = LM_USER + 2;

  SYM_ROW = 'row';
  SYM_CURRENT_ORDER = 'current_order';
  SYM_TICKS_PER_ROW = 'ticks_per_row';

  // Sound controller registers
  NR10 = $FF10;
  NR11 = $FF11;
  NR12 = $FF12;
  NR13 = $FF13;
  NR14 = $FF14;
  NR21 = $FF16;
  NR22 = $FF17;
  NR23 = $FF18;
  NR24 = $FF19;
  NR30 = $FF1A;
  NR31 = $FF1B;
  NR32 = $FF1C;
  NR33 = $FF1D;
  NR34 = $FF1E;
  NR41 = $FF20;
  NR42 = $FF21;
  NR43 = $FF22;
  NR44 = $FF23;

  LOWEST_NOTE = 0;
  C_3 = 0;
  Cs3 = 1;
  D_3 = 2;
  Ds3 = 3;
  E_3 = 4;
  F_3 = 5;
  Fs3 = 6;
  G_3 = 7;
  Gs3 = 8;
  A_3 = 9;
  As3 = 10;
  B_3 = 11;
  C_4 = 12;
  Cs4 = 13;
  D_4 = 14;
  Ds4 = 15;
  E_4 = 16;
  F_4 = 17;
  Fs4 = 18;
  G_4 = 19;
  Gs4 = 20;
  A_4 = 21;
  As4 = 22;
  B_4 = 23;
  C_5 = 24;
  Cs5 = 25;
  D_5 = 26;
  Ds5 = 27;
  E_5 = 28;
  F_5 = 29;
  Fs5 = 30;
  G_5 = 31;
  Gs5 = 32;
  A_5 = 33;
  As5 = 34;
  B_5 = 35;
  C_6 = 36;
  Cs6 = 37;
  D_6 = 38;
  Ds6 = 39;
  E_6 = 40;
  F_6 = 41;
  Fs6 = 42;
  G_6 = 43;
  Gs6 = 44;
  A_6 = 45;
  As6 = 46;
  B_6 = 47;
  C_7 = 48;
  Cs7 = 49;
  D_7 = 50;
  Ds7 = 51;
  E_7 = 52;
  F_7 = 53;
  Fs7 = 54;
  G_7 = 55;
  Gs7 = 56;
  A_7 = 57;
  As7 = 58;
  B_7 = 59;
  C_8 = 60;
  Cs8 = 61;
  D_8 = 62;
  Ds8 = 63;
  E_8 = 64;
  F_8 = 65;
  Fs8 = 66;
  G_8 = 67;
  Gs8 = 68;
  A_8 = 69;
  As8 = 70;
  B_8 = 71;
  HIGHEST_NOTE = 71;
  LAST_NOTE = 72;
  NO_NOTE = 90;

  // Note constants. These will probably go in a dictionary instead later
  {C_3  =  44;
  CS3  =  156;
  D_3  =  262;
  DS3  =  363;
  E_3  =  457;
  F_3  =  547;
  FS3  =  631;
  G_3  =  710;
  GS3  =  786;
  A_3  =  854;
  AS3  =  923;
  B_3  =  986;
  C_4  =  1046;
  CS4  =  1102;
  D_4  =  1155;
  DS4  =  1205;
  E_4  =  1253;
  F_4  =  1297;
  FS4  =  1339;
  G_4  =  1379;
  GS4  =  1417;
  A_4  =  1452;
  AS4  =  1486;
  B_4  =  1517;
  C_5  =  1546;
  CS5  =  1575;
  D_5  =  1602;
  DS5  =  1627;
  E_5  =  1650;
  F_5  =  1673;
  FS5  =  1694;
  G_5  =  1714;
  GS5  =  1732;
  A_5  =  1750;
  AS5  =  1767;
  B_5  =  1783;
  C_6  =  1798;
  CS6  =  1812;
  D_6  =  1825;
  DS6  =  1837;
  E_6  =  1849;
  F_6  =  1860;
  FS6  =  1871;
  G_6  =  1881;
  GS6  =  1890;
  A_6  =  1899;
  AS6  =  1907;
  B_6  =  1915;
  C_7  =  1923;
  CS7  =  1930;
  D_7  =  1936;
  DS7  =  1943;
  E_7  =  1949;
  F_7  =  1954;
  FS7  =  1959;
  G_7  =  1964;
  GS7  =  1969;
  A_7  =  1974;
  AS7  =  1978;
  B_7  =  1982;
  C_8  =  1985;
  CS8  =  1988;
  D_8  =  1992;
  DS8  =  1995;
  E_8  =  1998;
  F_8  =  2001;
  FS8  =  2004;
  G_8  =  2006;
  GS8  =  2009;
  A_8  =  2011;
  AS8  =  2013;
  B_8  =  2015;}

var
  NoteMap: TNoteMap;
  NoteToDriverMap: TNoteMap;
  Keybindings: TKeybindings;
  NotesToFreqs: TNoteToFreqMap;
  NoteToCodeMap: TNoteToCodeMap;

function NoteCodeToString(NoteCode: Integer): String;

implementation

uses LCLType;

function NoteCodeToString(NoteCode: Integer): String;
begin
  if not NoteMap.TryGetData(NoteCode, Result) then
    Result := '...';
end;

begin
  NoteMap := TNoteMap.Create;
  NoteToDriverMap := TNoteMap.Create;

  Keybindings := TKeybindings.Create;
  NotesToFreqs := TNoteToFreqMap.Create;
  NoteToCodeMap := TNoteToCodeMap.Create;

  {%Region Notes->Freqs}
  NotesToFreqs.Add(C_3, 44);
  NotesToFreqs.Add(CS3, 156);
  NotesToFreqs.Add(D_3, 262);
  NotesToFreqs.Add(DS3, 363);
  NotesToFreqs.Add(E_3, 457);
  NotesToFreqs.Add(F_3, 547);
  NotesToFreqs.Add(FS3, 631);
  NotesToFreqs.Add(G_3, 710);
  NotesToFreqs.Add(GS3, 786);
  NotesToFreqs.Add(A_3, 854);
  NotesToFreqs.Add(AS3, 923);
  NotesToFreqs.Add(B_3, 986);
  NotesToFreqs.Add(C_4, 1046);
  NotesToFreqs.Add(CS4, 1102);
  NotesToFreqs.Add(D_4, 1155);
  NotesToFreqs.Add(DS4, 1205);
  NotesToFreqs.Add(E_4, 1253);
  NotesToFreqs.Add(F_4, 1297);
  NotesToFreqs.Add(FS4, 1339);
  NotesToFreqs.Add(G_4, 1379);
  NotesToFreqs.Add(GS4, 1417);
  NotesToFreqs.Add(A_4, 1452);
  NotesToFreqs.Add(AS4, 1486);
  NotesToFreqs.Add(B_4, 1517);
  NotesToFreqs.Add(C_5, 1546);
  NotesToFreqs.Add(CS5, 1575);
  NotesToFreqs.Add(D_5, 1602);
  NotesToFreqs.Add(DS5, 1627);
  NotesToFreqs.Add(E_5, 1650);
  NotesToFreqs.Add(F_5, 1673);
  NotesToFreqs.Add(FS5, 1694);
  NotesToFreqs.Add(G_5, 1714);
  NotesToFreqs.Add(GS5, 1732);
  NotesToFreqs.Add(A_5, 1750);
  NotesToFreqs.Add(AS5, 1767);
  NotesToFreqs.Add(B_5, 1783);
  NotesToFreqs.Add(C_6, 1798);
  NotesToFreqs.Add(CS6, 1812);
  NotesToFreqs.Add(D_6, 1825);
  NotesToFreqs.Add(DS6, 1837);
  NotesToFreqs.Add(E_6, 1849);
  NotesToFreqs.Add(F_6, 1860);
  NotesToFreqs.Add(FS6, 1871);
  NotesToFreqs.Add(G_6, 1881);
  NotesToFreqs.Add(GS6, 1890);
  NotesToFreqs.Add(A_6, 1899);
  NotesToFreqs.Add(AS6, 1907);
  NotesToFreqs.Add(B_6, 1915);
  NotesToFreqs.Add(C_7, 1923);
  NotesToFreqs.Add(CS7, 1930);
  NotesToFreqs.Add(D_7, 1936);
  NotesToFreqs.Add(DS7, 1943);
  NotesToFreqs.Add(E_7, 1949);
  NotesToFreqs.Add(F_7, 1954);
  NotesToFreqs.Add(FS7, 1959);
  NotesToFreqs.Add(G_7, 1964);
  NotesToFreqs.Add(GS7, 1969);
  NotesToFreqs.Add(A_7, 1974);
  NotesToFreqs.Add(AS7, 1978);
  NotesToFreqs.Add(B_7, 1982);
  NotesToFreqs.Add(C_8, 1985);
  NotesToFreqs.Add(CS8, 1988);
  NotesToFreqs.Add(D_8, 1992);
  NotesToFreqs.Add(DS8, 1995);
  NotesToFreqs.Add(E_8, 1998);
  NotesToFreqs.Add(F_8, 2001);
  NotesToFreqs.Add(FS8, 2004);
  NotesToFreqs.Add(G_8, 2006);
  NotesToFreqs.Add(GS8, 2009);
  NotesToFreqs.Add(A_8, 2011);
  NotesToFreqs.Add(AS8, 2013);
  NotesToFreqs.Add(B_8, 2015);
  {%Endregion}

  {%Region}
  Keybindings.Add(VK_Q, C_3);
  Keybindings.Add(VK_W, CS3);
  Keybindings.Add(VK_E, D_3);
  Keybindings.Add(VK_R, DS3);
  Keybindings.Add(VK_T, E_3);
  Keybindings.Add(VK_Y, F_3);
  Keybindings.Add(VK_U, FS3);
  Keybindings.Add(VK_I, G_3);
  Keybindings.Add(VK_O, GS3);
  Keybindings.Add(VK_P, A_3);
  Keybindings.Add(VK_OEM_4, AS3);
  Keybindings.Add(VK_OEM_6, B_3);
  Keybindings.Add(VK_OEM_5, B_4);
  Keybindings.Add(VK_A, C_4);
  Keybindings.Add(VK_S, CS4);
  Keybindings.Add(VK_D, D_4);
  Keybindings.Add(VK_F, DS4);
  Keybindings.Add(VK_G, E_4);
  Keybindings.Add(VK_H, F_4);
  Keybindings.Add(VK_J, FS4);
  Keybindings.Add(VK_K, G_4);
  Keybindings.Add(VK_L, GS4);
  Keybindings.Add(VK_OEM_1, A_4);
  Keybindings.Add(VK_OEM_7, AS4);
  Keybindings.Add(VK_Z, C_5);
  Keybindings.Add(VK_X, CS5);
  Keybindings.Add(VK_C, D_5);
  Keybindings.Add(VK_V, DS5);
  Keybindings.Add(VK_B, E_5);
  Keybindings.Add(VK_N, F_5);
  Keybindings.Add(VK_M, FS5);
  Keybindings.Add(VK_OEM_COMMA, G_5);
  Keybindings.Add(VK_OEM_PERIOD, GS5);
  Keybindings.Add(VK_OEM_2, A_5);
  {%EndRegion Keycodes->Notes}

  {%Region Note names -> Notes}
  NoteToCodeMap.add('C-3', C_3);
  NoteToCodeMap.add('C#3', Cs3);
  NoteToCodeMap.add('D-3', D_3);
  NoteToCodeMap.add('D#3', Ds3);
  NoteToCodeMap.add('E-3', E_3);
  NoteToCodeMap.add('F-3', F_3);
  NoteToCodeMap.add('F#3', Fs3);
  NoteToCodeMap.add('G-3', G_3);
  NoteToCodeMap.add('G#3', Gs3);
  NoteToCodeMap.add('A-3', A_3);
  NoteToCodeMap.add('A#3', As3);
  NoteToCodeMap.add('B-3', B_3);
  NoteToCodeMap.add('C-4', C_4);
  NoteToCodeMap.add('C#4', Cs4);
  NoteToCodeMap.add('D-4', D_4);
  NoteToCodeMap.add('D#4', Ds4);
  NoteToCodeMap.add('E-4', E_4);
  NoteToCodeMap.add('F-4', F_4);
  NoteToCodeMap.add('F#4', Fs4);
  NoteToCodeMap.add('G-4', G_4);
  NoteToCodeMap.add('G#4', Gs4);
  NoteToCodeMap.add('A-4', A_4);
  NoteToCodeMap.add('A#4', As4);
  NoteToCodeMap.add('B-4', B_4);
  NoteToCodeMap.add('C-5', C_5);
  NoteToCodeMap.add('C#5', Cs5);
  NoteToCodeMap.add('D-5', D_5);
  NoteToCodeMap.add('D#5', Ds5);
  NoteToCodeMap.add('E-5', E_5);
  NoteToCodeMap.add('F-5', F_5);
  NoteToCodeMap.add('F#5', Fs5);
  NoteToCodeMap.add('G-5', G_5);
  NoteToCodeMap.add('G#5', Gs5);
  NoteToCodeMap.add('A-5', A_5);
  NoteToCodeMap.add('A#5', As5);
  NoteToCodeMap.add('B-5', B_5);
  NoteToCodeMap.add('C-6', C_6);
  NoteToCodeMap.add('C#6', Cs6);
  NoteToCodeMap.add('D-6', D_6);
  NoteToCodeMap.add('D#6', Ds6);
  NoteToCodeMap.add('E-6', E_6);
  NoteToCodeMap.add('F-6', F_6);
  NoteToCodeMap.add('F#6', Fs6);
  NoteToCodeMap.add('G-6', G_6);
  NoteToCodeMap.add('G#6', Gs6);
  NoteToCodeMap.add('A-6', A_6);
  NoteToCodeMap.add('A#6', As6);
  NoteToCodeMap.add('B-6', B_6);
  NoteToCodeMap.add('C-7', C_7);
  NoteToCodeMap.add('C#7', Cs7);
  NoteToCodeMap.add('D-7', D_7);
  NoteToCodeMap.add('D#7', Ds7);
  NoteToCodeMap.add('E-7', E_7);
  NoteToCodeMap.add('F-7', F_7);
  NoteToCodeMap.add('F#7', Fs7);
  NoteToCodeMap.add('G-7', G_7);
  NoteToCodeMap.add('G#7', Gs7);
  NoteToCodeMap.add('A-7', A_7);
  NoteToCodeMap.add('A#7', As7);
  NoteToCodeMap.add('B-7', B_7);
  NoteToCodeMap.add('C-8', C_8);
  NoteToCodeMap.add('C#8', Cs8);
  NoteToCodeMap.add('D-8', D_8);
  NoteToCodeMap.add('D#8', Ds8);
  NoteToCodeMap.add('E-8', E_8);
  NoteToCodeMap.add('F-8', F_8);
  NoteToCodeMap.add('F#8', Fs8);
  NoteToCodeMap.add('G-8', G_8);
  NoteToCodeMap.add('G#8', Gs8);
  NoteToCodeMap.add('A-8', A_8);
  NoteToCodeMap.add('A#8', As8);
  NoteToCodeMap.add('B-8', B_8);
  {%EndRegion}

  {%Region Notes -> Note names}
  NoteMap.add(C_3, 'C-3');
  NoteMap.add(Cs3, 'C#3');
  NoteMap.add(D_3, 'D-3');
  NoteMap.add(Ds3, 'D#3');
  NoteMap.add(E_3, 'E-3');
  NoteMap.add(F_3, 'F-3');
  NoteMap.add(Fs3, 'F#3');
  NoteMap.add(G_3, 'G-3');
  NoteMap.add(Gs3, 'G#3');
  NoteMap.add(A_3, 'A-3');
  NoteMap.add(As3, 'A#3');
  NoteMap.add(B_3, 'B-3');
  NoteMap.add(C_4, 'C-4');
  NoteMap.add(Cs4, 'C#4');
  NoteMap.add(D_4, 'D-4');
  NoteMap.add(Ds4, 'D#4');
  NoteMap.add(E_4, 'E-4');
  NoteMap.add(F_4, 'F-4');
  NoteMap.add(Fs4, 'F#4');
  NoteMap.add(G_4, 'G-4');
  NoteMap.add(Gs4, 'G#4');
  NoteMap.add(A_4, 'A-4');
  NoteMap.add(As4, 'A#4');
  NoteMap.add(B_4, 'B-4');
  NoteMap.add(C_5, 'C-5');
  NoteMap.add(Cs5, 'C#5');
  NoteMap.add(D_5, 'D-5');
  NoteMap.add(Ds5, 'D#5');
  NoteMap.add(E_5, 'E-5');
  NoteMap.add(F_5, 'F-5');
  NoteMap.add(Fs5, 'F#5');
  NoteMap.add(G_5, 'G-5');
  NoteMap.add(Gs5, 'G#5');
  NoteMap.add(A_5, 'A-5');
  NoteMap.add(As5, 'A#5');
  NoteMap.add(B_5, 'B-5');
  NoteMap.add(C_6, 'C-6');
  NoteMap.add(Cs6, 'C#6');
  NoteMap.add(D_6, 'D-6');
  NoteMap.add(Ds6, 'D#6');
  NoteMap.add(E_6, 'E-6');
  NoteMap.add(F_6, 'F-6');
  NoteMap.add(Fs6, 'F#6');
  NoteMap.add(G_6, 'G-6');
  NoteMap.add(Gs6, 'G#6');
  NoteMap.add(A_6, 'A-6');
  NoteMap.add(As6, 'A#6');
  NoteMap.add(B_6, 'B-6');
  NoteMap.add(C_7, 'C-7');
  NoteMap.add(Cs7, 'C#7');
  NoteMap.add(D_7, 'D-7');
  NoteMap.add(Ds7, 'D#7');
  NoteMap.add(E_7, 'E-7');
  NoteMap.add(F_7, 'F-7');
  NoteMap.add(Fs7, 'F#7');
  NoteMap.add(G_7, 'G-7');
  NoteMap.add(Gs7, 'G#7');
  NoteMap.add(A_7, 'A-7');
  NoteMap.add(As7, 'A#7');
  NoteMap.add(B_7, 'B-7');
  NoteMap.add(C_8, 'C-8');
  NoteMap.add(Cs8, 'C#8');
  NoteMap.add(D_8, 'D-8');
  NoteMap.add(Ds8, 'D#8');
  NoteMap.add(E_8, 'E-8');
  NoteMap.add(F_8, 'F-8');
  NoteMap.add(Fs8, 'F#8');
  NoteMap.add(G_8, 'G-8');
  NoteMap.add(Gs8, 'G#8');
  NoteMap.add(A_8, 'A-8');
  NoteMap.add(As8, 'A#8');
  NoteMap.add(B_8, 'B-8');
  {%EndRegion}

  {%Region Notes -> Driver constants}
  NoteToDriverMap.add(C_3, 'C_3');
  NoteToDriverMap.add(Cs3, 'C#3');
  NoteToDriverMap.add(D_3, 'D_3');
  NoteToDriverMap.add(Ds3, 'D#3');
  NoteToDriverMap.add(E_3, 'E_3');
  NoteToDriverMap.add(F_3, 'F_3');
  NoteToDriverMap.add(Fs3, 'F#3');
  NoteToDriverMap.add(G_3, 'G_3');
  NoteToDriverMap.add(Gs3, 'G#3');
  NoteToDriverMap.add(A_3, 'A_3');
  NoteToDriverMap.add(As3, 'A#3');
  NoteToDriverMap.add(B_3, 'B_3');
  NoteToDriverMap.add(C_4, 'C_4');
  NoteToDriverMap.add(Cs4, 'C#4');
  NoteToDriverMap.add(D_4, 'D_4');
  NoteToDriverMap.add(Ds4, 'D#4');
  NoteToDriverMap.add(E_4, 'E_4');
  NoteToDriverMap.add(F_4, 'F_4');
  NoteToDriverMap.add(Fs4, 'F#4');
  NoteToDriverMap.add(G_4, 'G_4');
  NoteToDriverMap.add(Gs4, 'G#4');
  NoteToDriverMap.add(A_4, 'A_4');
  NoteToDriverMap.add(As4, 'A#4');
  NoteToDriverMap.add(B_4, 'B_4');
  NoteToDriverMap.add(C_5, 'C_5');
  NoteToDriverMap.add(Cs5, 'C#5');
  NoteToDriverMap.add(D_5, 'D_5');
  NoteToDriverMap.add(Ds5, 'D#5');
  NoteToDriverMap.add(E_5, 'E_5');
  NoteToDriverMap.add(F_5, 'F_5');
  NoteToDriverMap.add(Fs5, 'F#5');
  NoteToDriverMap.add(G_5, 'G_5');
  NoteToDriverMap.add(Gs5, 'G#5');
  NoteToDriverMap.add(A_5, 'A_5');
  NoteToDriverMap.add(As5, 'A#5');
  NoteToDriverMap.add(B_5, 'B_5');
  NoteToDriverMap.add(C_6, 'C_6');
  NoteToDriverMap.add(Cs6, 'C#6');
  NoteToDriverMap.add(D_6, 'D_6');
  NoteToDriverMap.add(Ds6, 'D#6');
  NoteToDriverMap.add(E_6, 'E_6');
  NoteToDriverMap.add(F_6, 'F_6');
  NoteToDriverMap.add(Fs6, 'F#6');
  NoteToDriverMap.add(G_6, 'G_6');
  NoteToDriverMap.add(Gs6, 'G#6');
  NoteToDriverMap.add(A_6, 'A_6');
  NoteToDriverMap.add(As6, 'A#6');
  NoteToDriverMap.add(B_6, 'B_6');
  NoteToDriverMap.add(C_7, 'C_7');
  NoteToDriverMap.add(Cs7, 'C#7');
  NoteToDriverMap.add(D_7, 'D_7');
  NoteToDriverMap.add(Ds7, 'D#7');
  NoteToDriverMap.add(E_7, 'E_7');
  NoteToDriverMap.add(F_7, 'F_7');
  NoteToDriverMap.add(Fs7, 'F#7');
  NoteToDriverMap.add(G_7, 'G_7');
  NoteToDriverMap.add(Gs7, 'G#7');
  NoteToDriverMap.add(A_7, 'A_7');
  NoteToDriverMap.add(As7, 'A#7');
  NoteToDriverMap.add(B_7, 'B_7');
  NoteToDriverMap.add(C_8, 'C_8');
  NoteToDriverMap.add(Cs8, 'C#8');
  NoteToDriverMap.add(D_8, 'D_8');
  NoteToDriverMap.add(Ds8, 'D#8');
  NoteToDriverMap.add(E_8, 'E_8');
  NoteToDriverMap.add(F_8, 'F_8');
  NoteToDriverMap.add(Fs8, 'F#8');
  NoteToDriverMap.add(G_8, 'G_8');
  NoteToDriverMap.add(Gs8, 'G#8');
  NoteToDriverMap.add(A_8, 'A_8');
  NoteToDriverMap.add(As8, 'A#8');
  NoteToDriverMap.add(B_8, 'B_8');
  {%EndRegion}

end.
