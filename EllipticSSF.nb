(* Content-type: application/vnd.wolfram.mathematica *)

(*** Wolfram Notebook File ***)
(* http://www.wolfram.com/nb *)

(* CreatedBy='Mathematica 11.3' *)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[       158,          7]
NotebookDataLength[    157500,       3946]
NotebookOptionsPosition[    153380,       3873]
NotebookOutlinePosition[    153773,       3889]
CellTagsIndexPosition[    153730,       3886]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell[TextData[{
 StyleBox["Calculating Scalar Self Force Via Elliptic PDEs",
  FontSize->18],
 " "
}], "Title",
 CellChangeTimes->{{3.8418819561938267`*^9, 3.841881967926095*^9}, {
  3.8419504909372797`*^9, 3.841950493269058*^9}, {3.841953350155285*^9, 
  3.8419533751248293`*^9}, {3.842045383887711*^9, 3.84204538581566*^9}, {
  3.8420536613694267`*^9, 3.842053728632399*^9}, {3.8420541123635263`*^9, 
  3.8420541138848877`*^9}},ExpressionUUID->"f37d0bbd-96e4-4ff2-bd61-\
0873683266cb"],

Cell["\<\
Author: Nami Nishimura 
This is a  Mathematica Notebook to calculate the scalar self force via \
Elliptic PDEs. \
\>", "Text",
 CellChangeTimes->{{3.8420541172396507`*^9, 3.842054162520232*^9}, {
  3.842054222406159*^9, 
  3.8420542537923927`*^9}},ExpressionUUID->"c48cc65b-0960-4685-b4cc-\
eefd4674b470"],

Cell[BoxData[
 RowBox[{"ClearAll", "[", "\"\<Global`*\>\"", "]"}]], "Input",
 CellChangeTimes->{{3.841848883496105*^9, 3.8418488881132708`*^9}, {
  3.8419505938153152`*^9, 3.841950594311973*^9}},
 CellLabel->
  "In[125]:=",ExpressionUUID->"3ebbb7f6-82da-4b6a-969d-6d7c8cace00a"],

Cell[CellGroupData[{

Cell[TextData[StyleBox["Control those values ",
 FontSize->14]], "Section",
 CellChangeTimes->{{3.841951054918831*^9, 3.8419510612849417`*^9}, {
  3.8420542144043617`*^9, 
  3.842054216455208*^9}},ExpressionUUID->"3ff7a836-f66d-437c-be89-\
72f65d0c4e26"],

Cell["\<\
You can change those values to try different mode m, spin parameter a, mass \
M, and resolutions. \
\>", "Text",
 CellChangeTimes->{{3.842054268498616*^9, 
  3.842054300406185*^9}},ExpressionUUID->"74cbdda4-5c01-4929-9bad-\
c226b338e867"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"m", "=", "2"}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{"mode", " ", "m"}], " ", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"n", "=", "23"}], ";"}], " ", 
  RowBox[{"(*", " ", "resolution", " ", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"rminapp", "=", 
    RowBox[{"-", "20"}]}], ";"}], 
  RowBox[{"(*", 
   RowBox[{"approximate", " ", "value", " ", "for", " ", "the", " ", 
    SuperscriptBox["r", "*"], " ", "minimum"}], " ", 
   "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"rmaxapp", "=", "250"}], ";"}], 
  RowBox[{"(*", 
   RowBox[{"approximate", " ", "value", " ", "for", " ", "the", " ", 
    SuperscriptBox["r", "*"], " ", "maximum"}], "  ", 
   "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"q", "=", "1"}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{"sclar", " ", "charge"}], " ", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"d", "=", "3.6"}], ";"}], " ", 
  RowBox[{"(*", 
   RowBox[{"width", " ", "of", " ", "the", " ", "worldtube"}], " ", 
   "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"a", "=", "0.0"}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{"spin", " ", "parameter"}], " ", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"M", "=", "1"}], ";", " ", 
   RowBox[{"(*", " ", 
    RowBox[{
    "mass", " ", "of", " ", "the", " ", "central", " ", "black", " ", 
     "hole"}], " ", "*)"}], "\[IndentingNewLine]", 
   RowBox[{"r0", "=", "10.0"}], ";"}], 
  RowBox[{"(*", " ", 
   RowBox[{"location", " ", "of", " ", "the", " ", "worldline"}], " ", 
   "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"v", "=", 
   RowBox[{"1", "/", 
    RowBox[{"Sqrt", "[", "r0", "]"}]}]}], ";", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"particle", "'"}], "s", " ", "angular", " ", "velocity"}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{"\[CapitalOmega]", "=", 
   RowBox[{
    RowBox[{"v", "^", "3"}], "/", 
    RowBox[{"(", 
     RowBox[{"1", "+", 
      RowBox[{"a", " ", 
       RowBox[{"v", "^", "3"}]}]}], ")"}]}]}], ";", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"particle", "'"}], "s", " ", "angular", " ", "frequency"}], " ", 
   "*)"}], "\[IndentingNewLine]"}]}], "Input",
 CellChangeTimes->{{3.841950545268956*^9, 3.841950555092762*^9}, {
   3.841950598735415*^9, 3.841950618035445*^9}, {3.841950787768845*^9, 
   3.8419507907269917`*^9}, {3.841951044428143*^9, 3.8419510478259974`*^9}, {
   3.841951213619014*^9, 3.8419512272313232`*^9}, {3.8419527647142057`*^9, 
   3.841952764830862*^9}, {3.8419535364898033`*^9, 3.841953536532783*^9}, {
   3.841953650115738*^9, 3.841953650250659*^9}, {3.8419539097348022`*^9, 
   3.841953911632213*^9}, {3.841953956721077*^9, 3.841953956799931*^9}, {
   3.841954067385146*^9, 3.841954068217444*^9}, {3.841957667248465*^9, 
   3.841957667329781*^9}, {3.8419617681302557`*^9, 3.841961768562203*^9}, {
   3.841962285971484*^9, 3.841962286239972*^9}, {3.841962337229815*^9, 
   3.841962338593548*^9}, 3.84196303117315*^9, {3.841967071007557*^9, 
   3.841967071079571*^9}, {3.841967427021562*^9, 3.841967427453684*^9}, {
   3.841967603578947*^9, 3.841967603808405*^9}, {3.841967848350844*^9, 
   3.841967848676903*^9}, {3.84196832032524*^9, 3.8419683204526863`*^9}, {
   3.8419690082114763`*^9, 3.8419690082597513`*^9}, {3.841969905029593*^9, 
   3.841969906520997*^9}, {3.841977391148794*^9, 3.841977393162599*^9}, {
   3.8419774585756474`*^9, 3.841977459376959*^9}, {3.8419775945969067`*^9, 
   3.841977595571447*^9}, {3.841978528314225*^9, 3.84197853088694*^9}, {
   3.841978614032848*^9, 3.841978614778013*^9}, {3.8419788310236473`*^9, 
   3.8419788317229853`*^9}, {3.8419792585124207`*^9, 3.841979259330481*^9}, {
   3.8419795549431562`*^9, 3.841979555362031*^9}, {3.8419800086114073`*^9, 
   3.841980008990447*^9}, {3.841980738043922*^9, 3.841980738186187*^9}, {
   3.8419821549218273`*^9, 3.84198215570415*^9}, {3.841982313398005*^9, 
   3.8419823146672792`*^9}, {3.8419840089331512`*^9, 3.841984009679306*^9}, {
   3.841984120343524*^9, 3.8419841218762836`*^9}, {3.8419862165945807`*^9, 
   3.8419862176432543`*^9}, {3.841988493914716*^9, 3.841988494243197*^9}, {
   3.8419927905150213`*^9, 3.8419927910740223`*^9}, {3.842002343279538*^9, 
   3.842002343409873*^9}, {3.842034038355462*^9, 3.8420340387625427`*^9}, {
   3.842042886281644*^9, 3.842042886420267*^9}, {3.8420431487426777`*^9, 
   3.84204314885575*^9}, {3.842043532016061*^9, 3.842043557482641*^9}, {
   3.842043696746478*^9, 3.842043696940096*^9}, {3.8420440069622707`*^9, 
   3.842044007012925*^9}, {3.84204424259944*^9, 3.842044242694367*^9}, {
   3.84204453736609*^9, 3.842044537479885*^9}, {3.84204475337461*^9, 
   3.842044753491061*^9}, {3.842045037069316*^9, 3.8420450374487543`*^9}, {
   3.842045392965384*^9, 3.842045393080426*^9}, {3.842046739568968*^9, 
   3.8420467398063087`*^9}, {3.842047288461194*^9, 3.842047289978056*^9}, {
   3.842047908078245*^9, 3.842047908160988*^9}, {3.8420493884445143`*^9, 
   3.842049388638528*^9}, {3.842053799913885*^9, 3.84205390795227*^9}, {
   3.842054009757987*^9, 3.8420540145036707`*^9}, {3.842054305535605*^9, 
   3.8420543217258463`*^9}, {3.842054381862817*^9, 
   3.842054410495432*^9}},ExpressionUUID->"67ca88b1-82c0-48f4-bfff-\
de7e4dc3445f"]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[StyleBox["Importing Effective Source  ",
 FontSize->14]], "Section",
 CellChangeTimes->{
  3.84205393207409*^9, {3.842053969933585*^9, 
   3.842053981103421*^9}},ExpressionUUID->"7690f977-825a-4420-8f26-\
9d398db58f14"],

Cell[BoxData[{
 RowBox[{"SetDirectory", "[", 
  RowBox[{"NotebookDirectory", "[", "]"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"link", "=", 
   RowBox[{"Install", "[", "\"\<a.out\>\"", "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"InitializeSeff", "[", 
   RowBox[{"r0", ",", "a"}], "]"}], ";"}]}], "Input",
 CellChangeTimes->{{3.842053988231679*^9, 
  3.842054005221786*^9}},ExpressionUUID->"0bd965e4-6fe3-4117-b842-\
a4a52a8f9465"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"Here", ",", " ", 
    RowBox[{
     RowBox[{
      RowBox[{"I", "'"}], "m", " ", "calling", " ", "the", " ", "C"}], "-", 
     RowBox[{
     "code", " ", "\"\<kerr-circular.c\>\"", " ", "created", " ", "by", " ", 
      "Barry", " ", "Wardell"}]}], ",", " ", 
    RowBox[{
     RowBox[{
     "which", " ", "is", " ", "available", " ", "on", " ", "his", " ", 
      "website", " ", 
      RowBox[{"https", ":"}]}], "//", 
     RowBox[{
      RowBox[{
       RowBox[{
        RowBox[{
         RowBox[{
          RowBox[{
           RowBox[{"github", ".", "com"}], "/", "barrywardell"}], "/", 
          "EffectiveSource"}], "/", "blob"}], "/", "master"}], "/", "kerr"}], 
      "-", 
      RowBox[{"circular", ".", "c"}]}]}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
     RowBox[{"\"\<a.out\>\"", " ", "is", " ", "this", " ", "C"}], "-", 
     "code"}], ",", " ", 
    RowBox[{
    "adjusted", " ", "to", " ", "work", " ", "for", " ", "Mathematica", " ", 
     "Notebook"}]}], " ", "*)"}], " ", "\[IndentingNewLine]", " "}]], "Input",\

 CellChangeTimes->{{3.8420540387708597`*^9, 3.8420540453513412`*^9}, {
  3.842054419169812*^9, 
  3.842054544150737*^9}},ExpressionUUID->"b8f7e19d-912d-4d8f-b461-\
f8dd43e2335e"]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[StyleBox["Effective Source Calculation ",
 FontSize->14]], "Section",
 CellChangeTimes->{{3.84195109730754*^9, 
  3.841951118293662*^9}},ExpressionUUID->"d592f90c-bd56-4cff-80ab-\
3f57113c647a"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"Delta", "[", 
    RowBox[{"a_", ",", " ", "rSubRPlus_"}], "]"}], " ", ":=", "\n", "  ", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"r", ",", " ", "rPlus", ",", " ", "rMinus"}], "}"}], ",", "\n", 
     "    ", 
     RowBox[{
      RowBox[{"rPlus", " ", "=", " ", 
       RowBox[{"1", " ", "+", " ", 
        RowBox[{"Sqrt", "[", 
         RowBox[{"1", " ", "-", " ", 
          RowBox[{"a", "^", "2"}]}], "]"}]}]}], ";", "\n", "    ", 
      RowBox[{"rMinus", " ", "=", " ", 
       RowBox[{"1", " ", "-", " ", 
        RowBox[{"Sqrt", "[", 
         RowBox[{"1", " ", "-", " ", 
          RowBox[{"a", "^", "2"}]}], "]"}]}]}], ";", "\n", "    ", 
      RowBox[{"r", " ", "=", " ", 
       RowBox[{"rSubRPlus", " ", "+", " ", "rPlus"}]}], ";", "\n", "    ", 
      RowBox[{"rSubRPlus", " ", 
       RowBox[{"(", 
        RowBox[{"r", " ", "-", " ", "rMinus"}], ")"}]}]}]}], "\n", "  ", 
    "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"Sigma", "[", 
    RowBox[{"a_", ",", " ", "rSubRPlus_", ",", " ", "\[Theta]_"}], "]"}], " ",
    ":=", "\n", "  ", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"r", ",", " ", "rPlus", ",", " ", "rMinus"}], "}"}], ",", "\n", 
     "    ", 
     RowBox[{
      RowBox[{"rPlus", " ", "=", " ", 
       RowBox[{"1", " ", "+", " ", 
        RowBox[{"Sqrt", "[", 
         RowBox[{"1", " ", "-", " ", 
          RowBox[{"a", "^", "2"}]}], "]"}]}]}], ";", "\n", "    ", 
      RowBox[{"rMinus", " ", "=", " ", 
       RowBox[{"1", " ", "-", " ", 
        RowBox[{"Sqrt", "[", 
         RowBox[{"1", " ", "-", " ", 
          RowBox[{"a", "^", "2"}]}], "]"}]}]}], ";", "\n", "    ", 
      RowBox[{"r", " ", "=", " ", 
       RowBox[{"rSubRPlus", " ", "+", " ", "rPlus"}]}], ";", "\n", "    ", 
      RowBox[{"Sqrt", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{"r", "^", "2"}], " ", "+", " ", 
           RowBox[{"a", "^", "2"}]}], ")"}], "^", "2"}], " ", "-", " ", 
        RowBox[{
         RowBox[{"a", "^", "2"}], " ", 
         RowBox[{"Delta", "[", 
          RowBox[{"a", ",", " ", "rSubRPlus"}], "]"}], " ", 
         RowBox[{
          RowBox[{"Sin", "[", "\[Theta]", "]"}], "^", "2"}]}]}], "]"}]}]}], 
    "\n", "  ", "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"\[CapitalDelta]\[Phi]", "[", 
     RowBox[{"a_", ",", " ", "rSubRPlus_"}], "]"}], " ", ":=", "\n", "  ", 
    RowBox[{"Module", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"rPlus", ",", " ", "rMinus", ",", " ", "r"}], "}"}], ",", "\n",
       "    ", 
      RowBox[{
       RowBox[{"rPlus", " ", "=", " ", 
        RowBox[{"1", " ", "+", " ", 
         RowBox[{"Sqrt", "[", 
          RowBox[{"1", " ", "-", " ", 
           RowBox[{"a", "^", "2"}]}], "]"}]}]}], ";", "\n", "    ", 
       RowBox[{"rMinus", " ", "=", " ", 
        RowBox[{"1", " ", "-", " ", 
         RowBox[{"Sqrt", "[", 
          RowBox[{"1", " ", "-", " ", 
           RowBox[{"a", "^", "2"}]}], "]"}]}]}], ";", "\n", "    ", 
       RowBox[{"r", " ", "=", " ", 
        RowBox[{"rSubRPlus", " ", "+", " ", "rPlus"}]}], ";", "\n", "    ", 
       RowBox[{
        RowBox[{"a", " ", "/", " ", 
         RowBox[{"(", 
          RowBox[{"rPlus", " ", "-", " ", "rMinus"}], ")"}]}], " ", 
        RowBox[{"Log", "[", 
         RowBox[{"rSubRPlus", " ", "/", " ", 
          RowBox[{"(", 
           RowBox[{"r", " ", "-", " ", "rMinus"}], ")"}]}], "]"}]}]}]}], "\n",
      "  ", "]"}]}], ";"}], " ", "\n", "\n"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"scaled\[CapitalPhi]Pm", "[", 
    RowBox[{"m_", ",", "r_", ",", "\[Theta]_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", "rPlus", "}"}], ",", 
     RowBox[{
      RowBox[{"rPlus", "=", 
       RowBox[{"1", "+", 
        RowBox[{"Sqrt", "[", 
         RowBox[{"1", "-", 
          RowBox[{"a", "^", "2"}]}], "]"}]}]}], ";", 
      RowBox[{
       RowBox[{"PsiPm", "[", 
        RowBox[{"m", ",", "r", ",", "\[Theta]"}], "]"}], 
       RowBox[{
        RowBox[{"Exp", "[", 
         RowBox[{
          RowBox[{"-", "I"}], " ", "m", " ", 
          RowBox[{"\[CapitalDelta]\[Phi]", "[", 
           RowBox[{"a", ",", 
            RowBox[{"r", "-", "rPlus"}]}], "]"}]}], "]"}], "/", 
        RowBox[{"(", 
         RowBox[{"2", " ", "\[Pi]", " ", "r"}], ")"}]}]}]}]}], "]"}]}], 
  ";"}], "\n", 
 RowBox[{
  RowBox[{
   RowBox[{"scaledSeffm", "[", 
    RowBox[{"m_", ",", "r_", ",", "\[Theta]_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", "rPlus", "}"}], ",", 
     RowBox[{
      RowBox[{"rPlus", "=", 
       RowBox[{"1", "+", 
        RowBox[{"Sqrt", "[", 
         RowBox[{"1", "-", 
          RowBox[{"a", "^", "2"}]}], "]"}]}]}], ";", 
      RowBox[{
       RowBox[{"Seffm", "[", 
        RowBox[{"m", ",", "r", ",", "\[Theta]"}], "]"}], 
       RowBox[{
        RowBox[{"Exp", "[", 
         RowBox[{
          RowBox[{"-", "I"}], " ", "m", " ", 
          RowBox[{"\[CapitalDelta]\[Phi]", "[", 
           RowBox[{"a", ",", 
            RowBox[{"r", "-", "rPlus"}]}], "]"}]}], "]"}], "/", 
        RowBox[{"(", 
         RowBox[{"2", " ", "\[Pi]"}], ")"}]}]}]}]}], "]"}]}], 
  ";"}], "\n"}], "Input",
 CellChangeTimes->{{3.841848907413227*^9, 3.84184891492435*^9}, {
   3.8419539657752743`*^9, 3.841953966032633*^9}, 
   3.842054683814534*^9},ExpressionUUID->"804e41a7-b548-4be0-a4cd-\
bab3656cf3b7"]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[StyleBox["Solving m-mode scalar wave operator ",
 FontSize->14]], "Section",
 CellChangeTimes->{{3.8420548614267483`*^9, 
  3.8420548858345137`*^9}},ExpressionUUID->"d50da622-bbea-4160-8a95-\
8a8039f7f9ca"],

Cell[TextData[{
 "Here, I\[CloseCurlyQuote]m solving a m-mode scalar wave operator by using \
finite difference approximation. \nThe coefficient of ",
 Cell[BoxData[
  SubscriptBox["\[Psi]", 
   RowBox[{"i", ",", "j"}]]],
  CellChangeTimes->{{3.823078864766282*^9, 3.823078864986223*^9}, {
    3.823078991391686*^9, 3.823079007363933*^9}, 3.823079121177052*^9, {
    3.823079207085441*^9, 3.823079271442193*^9}, {3.823079320551765*^9, 
    3.823079444778015*^9}, {3.823079475028203*^9, 3.8230795207021837`*^9}, {
    3.8230795633395348`*^9, 3.823079569982396*^9}, 3.823079627734878*^9, {
    3.823079680756629*^9, 3.8230797075921164`*^9}, {3.823083928373526*^9, 
    3.823083934008676*^9}, {3.8230844690899563`*^9, 3.8230844702091217`*^9}, {
    3.8230997796794558`*^9, 3.82309981469947*^9}, {3.823099981302134*^9, 
    3.823099981631988*^9}, {3.823264496910192*^9, 3.823264507843524*^9}, {
    3.824905895509569*^9, 3.8249059556487083`*^9}, 3.824981086134502*^9, {
    3.8258678109090223`*^9, 3.8258678127565413`*^9}},
  FontSize->12,ExpressionUUID->"981674a2-e347-4e34-9a2f-5062d700f648"],
 ", ",
 Cell[BoxData[
  SubscriptBox["\[Psi]", 
   RowBox[{
    RowBox[{"i", "+", "1"}], ",", "j"}]]],
  CellChangeTimes->{{3.823078864766282*^9, 3.823078864986223*^9}, {
    3.823078991391686*^9, 3.823079007363933*^9}, 3.823079121177052*^9, {
    3.823079207085441*^9, 3.823079271442193*^9}, {3.823079320551765*^9, 
    3.823079444778015*^9}, {3.823079475028203*^9, 3.8230795207021837`*^9}, {
    3.8230795633395348`*^9, 3.823079569982396*^9}, 3.823079627734878*^9, {
    3.823079680756629*^9, 3.8230797075921164`*^9}, {3.823083928373526*^9, 
    3.823083934008676*^9}, {3.8230844690899563`*^9, 3.8230844702091217`*^9}, {
    3.8230997796794558`*^9, 3.82309981469947*^9}, {3.823099981302134*^9, 
    3.823099981631988*^9}, {3.823264496910192*^9, 3.823264507843524*^9}, {
    3.824905895509569*^9, 3.8249059556487083`*^9}, 3.824981086134502*^9, {
    3.8258678109090223`*^9, 3.8258678127565413`*^9}},
  FontSize->12,ExpressionUUID->"e1bf9017-c7f4-4b23-8768-68d005dda796"],
 ",",
 Cell[BoxData[
  RowBox[{" ", 
   SubscriptBox["\[Psi]", 
    RowBox[{
     RowBox[{"i", "-", "1"}], ",", " ", "j"}]]}]],
  CellChangeTimes->{{3.823078864766282*^9, 3.823078864986223*^9}, {
    3.823078991391686*^9, 3.823079007363933*^9}, 3.823079121177052*^9, {
    3.823079207085441*^9, 3.823079271442193*^9}, {3.823079320551765*^9, 
    3.823079444778015*^9}, {3.823079475028203*^9, 3.8230795207021837`*^9}, {
    3.8230795633395348`*^9, 3.823079569982396*^9}, 3.823079627734878*^9, {
    3.823079680756629*^9, 3.8230797075921164`*^9}, {3.823083928373526*^9, 
    3.823083934008676*^9}, {3.8230844690899563`*^9, 3.8230844702091217`*^9}, {
    3.8230997796794558`*^9, 3.82309981469947*^9}, {3.823099981302134*^9, 
    3.823099981631988*^9}, {3.823264496910192*^9, 3.823264507843524*^9}, {
    3.824905895509569*^9, 3.8249059556487083`*^9}, 3.824981086134502*^9, {
    3.8258678109090223`*^9, 3.8258678127565413`*^9}},
  FontSize->12,ExpressionUUID->"5b715d12-be75-4894-9585-acc60a2cc46c"],
 ",",
 Cell[BoxData[
  RowBox[{" ", 
   SubscriptBox["\[Psi]", 
    RowBox[{"i", ",", 
     RowBox[{"j", "+", "1"}]}]], " "}]],
  CellChangeTimes->{{3.823078864766282*^9, 3.823078864986223*^9}, {
    3.823078991391686*^9, 3.823079007363933*^9}, 3.823079121177052*^9, {
    3.823079207085441*^9, 3.823079271442193*^9}, {3.823079320551765*^9, 
    3.823079444778015*^9}, {3.823079475028203*^9, 3.8230795207021837`*^9}, {
    3.8230795633395348`*^9, 3.823079569982396*^9}, 3.823079627734878*^9, {
    3.823079680756629*^9, 3.8230797075921164`*^9}, {3.823083928373526*^9, 
    3.823083934008676*^9}, {3.8230844690899563`*^9, 3.8230844702091217`*^9}, {
    3.8230997796794558`*^9, 3.82309981469947*^9}, {3.823099981302134*^9, 
    3.823099981631988*^9}, {3.823264496910192*^9, 3.823264507843524*^9}, {
    3.824905895509569*^9, 3.8249059556487083`*^9}, 3.824981086134502*^9, {
    3.8258678109090223`*^9, 3.8258678127565413`*^9}},
  FontSize->12,ExpressionUUID->"a5a6fb1a-a062-4d98-803c-2ef838f65214"],
 " and ",
 Cell[BoxData[
  SubscriptBox["\[Psi]", 
   RowBox[{"i", ",", 
    RowBox[{"j", "-", "1"}]}]]],
  CellChangeTimes->{{3.823078864766282*^9, 3.823078864986223*^9}, {
    3.823078991391686*^9, 3.823079007363933*^9}, 3.823079121177052*^9, {
    3.823079207085441*^9, 3.823079271442193*^9}, {3.823079320551765*^9, 
    3.823079444778015*^9}, {3.823079475028203*^9, 3.8230795207021837`*^9}, {
    3.8230795633395348`*^9, 3.823079569982396*^9}, 3.823079627734878*^9, {
    3.823079680756629*^9, 3.8230797075921164`*^9}, {3.823083928373526*^9, 
    3.823083934008676*^9}, {3.8230844690899563`*^9, 3.8230844702091217`*^9}, {
    3.8230997796794558`*^9, 3.82309981469947*^9}, {3.823099981302134*^9, 
    3.823099981631988*^9}, {3.823264496910192*^9, 3.823264507843524*^9}, {
    3.824905895509569*^9, 3.8249059556487083`*^9}, 3.824981086134502*^9, {
    3.8258678109090223`*^9, 3.8258678127565413`*^9}},
  FontSize->12,ExpressionUUID->"52e4e314-9358-47d1-8d9f-cbbc059310df"],
 " are calculated (which are controlled by the parameter \
\[OpenCurlyDoubleQuote]A\[CloseCurlyDoubleQuote] inside this function) \n\
Function below was re-implemented for package friendliness "
}], "Text",
 CellChangeTimes->{{3.842054908424655*^9, 3.842054936226166*^9}, 
   3.8420550330324697`*^9, {3.842055097329752*^9, 3.842055176808155*^9}, {
   3.8420555508203382`*^9, 
   3.842055590141448*^9}},ExpressionUUID->"cb8b90ac-bff5-45ac-9395-\
e9350faad53c"],

Cell[BoxData[
 RowBox[{
  RowBox[{"getfxyCoeff", "[", 
   RowBox[{
   "r_", ",", " ", "\[Theta]_", ",", " ", "A_", ",", " ", 
    "\[CapitalDelta]rstar_", ",", " ", "\[CapitalDelta]\[Theta]_", ",", " ", 
    "m_"}], "]"}], " ", ":=", 
  RowBox[{"Module", "[", " ", 
   RowBox[{
    RowBox[{"{", "M", "}"}], ",", "\n", "    ", 
    RowBox[{
     RowBox[{"M", " ", "=", " ", "1"}], ";", "\n", "    ", 
     RowBox[{"Return", "[", "\n", "      ", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"A", " ", "==", " ", "1"}], ",", "\n", "        ", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"a", "^", "2"}], " ", 
            RowBox[{"m", "^", "2"}], " ", 
            RowBox[{"r", "^", "2"}], " ", 
            RowBox[{"(", 
             RowBox[{
              RowBox[{"a", "^", "2"}], " ", "+", " ", 
              RowBox[{"r", " ", 
               RowBox[{"(", 
                RowBox[{
                 RowBox[{
                  RowBox[{"-", "2"}], " ", "M"}], " ", "+", " ", "r"}], 
                ")"}]}]}], ")"}], " ", 
            RowBox[{"\[CapitalDelta]rstar", "^", "2"}], " ", 
            RowBox[{"\[CapitalDelta]\[Theta]", "^", "2"}], " ", 
            RowBox[{"\[CapitalOmega]", "^", "2"}]}], " ", "+", " ", 
           RowBox[{
            RowBox[{"(", 
             RowBox[{
              RowBox[{"2", " ", 
               RowBox[{"r", "^", "2"}], " ", "\n", "          ", 
               RowBox[{"(", 
                RowBox[{
                 RowBox[{"a", "^", "2"}], " ", "+", " ", 
                 RowBox[{"r", " ", 
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{
                    RowBox[{"-", "2"}], " ", "M"}], " ", "+", " ", "r"}], 
                   ")"}]}]}], ")"}], " ", 
               RowBox[{"\[CapitalDelta]rstar", "^", "2"}]}], " ", "+", " ", 
              RowBox[{"2", " ", 
               RowBox[{"(", 
                RowBox[{
                 RowBox[{
                  RowBox[{"r", "^", "2"}], " ", 
                  RowBox[{
                   RowBox[{"(", 
                    RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "+", " ", 
                    RowBox[{"r", "^", "2"}]}], ")"}], "^", "2"}]}], " ", "-", 
                 " ", 
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "-", " ", 
                    RowBox[{"I", " ", "a", " ", "m", " ", "r"}], "\n", 
                    "           ", "-", " ", 
                    RowBox[{"M", " ", "r"}]}], ")"}], " ", 
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "+", " ", 
                    RowBox[{"r", " ", 
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"-", "2"}], " ", "M"}], " ", "+", " ", "r"}], 
                    ")"}]}]}], ")"}], " ", 
                  RowBox[{"\[CapitalDelta]rstar", "^", "2"}]}]}], ")"}], " ", 
               
               RowBox[{"\[CapitalDelta]\[Theta]", "^", "2"}]}], " ", "+", " ", 
              RowBox[{"4", " ", "a", " ", 
               RowBox[{"m", "^", "2"}], " ", "M", " ", 
               RowBox[{"r", "^", "3"}], " ", 
               RowBox[{"\[CapitalDelta]rstar", "^", "2"}], " ", "\n", 
               "          ", 
               RowBox[{"\[CapitalDelta]\[Theta]", "^", "2"}], " ", 
               "\[CapitalOmega]"}], " ", "-", " ", 
              RowBox[{
               RowBox[{"m", "^", "2"}], " ", 
               RowBox[{"r", "^", "2"}], " ", 
               RowBox[{
                RowBox[{"(", 
                 RowBox[{
                  RowBox[{"a", "^", "2"}], " ", "+", " ", 
                  RowBox[{"r", "^", "2"}]}], ")"}], "^", "2"}], " ", 
               RowBox[{"\[CapitalDelta]rstar", "^", "2"}], " ", 
               RowBox[{"\[CapitalDelta]\[Theta]", "^", "2"}], " ", 
               RowBox[{"\[CapitalOmega]", "^", "2"}]}]}], ")"}], " ", 
            RowBox[{
             RowBox[{"Csc", "[", "\[Theta]", "]"}], "^", "2"}]}], " ", "+", 
           " ", 
           RowBox[{
            RowBox[{"m", "^", "2"}], " ", 
            RowBox[{"r", "^", "2"}], " ", "\n", "          ", 
            RowBox[{"(", 
             RowBox[{
              RowBox[{"a", "^", "2"}], " ", "+", " ", 
              RowBox[{"r", " ", 
               RowBox[{"(", 
                RowBox[{
                 RowBox[{
                  RowBox[{"-", "2"}], " ", "M"}], " ", "+", " ", "r"}], 
                ")"}]}]}], ")"}], " ", 
            RowBox[{"\[CapitalDelta]rstar", "^", "2"}], " ", 
            RowBox[{"\[CapitalDelta]\[Theta]", "^", "2"}], " ", 
            RowBox[{
             RowBox[{"Csc", "[", "\[Theta]", "]"}], "^", "4"}]}]}], ")"}], 
         " ", "/", " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"r", "^", "2"}], " ", 
           RowBox[{"\[CapitalDelta]rstar", "^", "2"}], " ", 
           RowBox[{"\[CapitalDelta]\[Theta]", "^", "2"}], " ", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{
              RowBox[{"-", 
               RowBox[{"a", "\n", "          ", "^", "2"}]}], " ", 
              RowBox[{"(", 
               RowBox[{
                RowBox[{"a", "^", "2"}], " ", "+", " ", 
                RowBox[{"r", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "2"}], " ", "M"}], " ", "+", " ", "r"}], 
                  ")"}]}]}], ")"}]}], " ", "+", " ", 
             RowBox[{
              RowBox[{
               RowBox[{"(", 
                RowBox[{
                 RowBox[{"a", "^", "2"}], " ", "+", " ", 
                 RowBox[{"r", "^", "2"}]}], ")"}], "^", "2"}], " ", 
              RowBox[{
               RowBox[{"Csc", "[", "\[Theta]", "]"}], "^", "2"}]}]}], ")"}]}],
           ")"}]}], "\n", "        ", ",", "\n", "        ", 
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"A", " ", "==", " ", "2"}], ",", "\n", "          ", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{
             RowBox[{
              RowBox[{"-", "r"}], " ", 
              RowBox[{
               RowBox[{"(", 
                RowBox[{
                 RowBox[{"a", "^", "2"}], " ", "+", " ", 
                 RowBox[{"r", "^", "2"}]}], ")"}], "^", "2"}]}], " ", "+", 
             " ", 
             RowBox[{"a", " ", 
              RowBox[{"(", 
               RowBox[{
                RowBox[{"a", "^", "3"}], " ", "-", " ", 
                RowBox[{"I", " ", 
                 RowBox[{"a", "^", "2"}], " ", "m", " ", "r"}], " ", "-", " ", 
                RowBox[{"I", " ", "m", " ", 
                 RowBox[{"r", "^", "3"}]}], " ", "+", " ", 
                RowBox[{"a", " ", "r", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "2"}], " ", "\n", "            ", "M"}], " ",
                    "+", " ", "r"}], ")"}]}]}], ")"}], " ", 
              "\[CapitalDelta]rstar"}]}], ")"}], " ", "/", " ", 
           RowBox[{"(", 
            RowBox[{"r", " ", 
             RowBox[{"\[CapitalDelta]rstar", "^", "2"}], " ", 
             RowBox[{"(", 
              RowBox[{
               RowBox[{
                RowBox[{"(", 
                 RowBox[{
                  RowBox[{"a", "^", "2"}], " ", "+", " ", 
                  RowBox[{"r", "^", "2"}]}], ")"}], "^", "2"}], " ", "-", " ", 
               RowBox[{
                RowBox[{"a", "^", "2"}], " ", 
                RowBox[{"(", 
                 RowBox[{
                  RowBox[{"a", "^", "2"}], " ", "+", " ", 
                  RowBox[{"r", " ", 
                   RowBox[{"(", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"-", "2"}], " ", "M"}], " ", "+", " ", "r"}], 
                    "\n", "            ", ")"}]}]}], ")"}], " ", 
                RowBox[{
                 RowBox[{"Sin", "[", "\[Theta]", "]"}], "^", "2"}]}]}], 
              ")"}]}], ")"}]}], "\n", "          ", ",", "\n", "          ", 
          RowBox[{"If", "[", 
           RowBox[{
            RowBox[{"A", " ", "==", " ", "3"}], ",", "\n", "            ", 
            RowBox[{
             RowBox[{"-", 
              RowBox[{"(", 
               RowBox[{
                RowBox[{"r", " ", 
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "+", " ", 
                    RowBox[{"r", "^", "2"}]}], ")"}], "^", "2"}]}], " ", "+", 
                " ", 
                RowBox[{"a", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"a", "^", "3"}], " ", "-", " ", 
                   RowBox[{"I", " ", 
                    RowBox[{"a", "^", "2"}], " ", "m", " ", "r"}], " ", "-", 
                   " ", 
                   RowBox[{"I", " ", "m", " ", 
                    RowBox[{"r", "^", "3"}]}], " ", "+", " ", 
                   RowBox[{"a", " ", "r", " ", 
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"-", "\n", "              ", "2"}], " ", "M"}], 
                    " ", "+", " ", "r"}], ")"}]}]}], ")"}], " ", 
                 "\[CapitalDelta]rstar"}]}], ")"}]}], " ", "/", " ", 
             RowBox[{"(", 
              RowBox[{"r", " ", 
               RowBox[{"\[CapitalDelta]rstar", "^", "2"}], " ", 
               RowBox[{"(", 
                RowBox[{
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "+", " ", 
                    RowBox[{"r", "^", "2"}]}], ")"}], "^", "2"}], " ", "-", 
                 " ", 
                 RowBox[{
                  RowBox[{"a", "^", "2"}], " ", 
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "+", " ", 
                    RowBox[{"r", " ", 
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"-", "2"}], " ", "M"}], " ", "+", "\n", 
                    "               ", "r"}], ")"}]}]}], ")"}], " ", 
                  RowBox[{
                   RowBox[{"Sin", "[", "\[Theta]", "]"}], "^", "2"}]}]}], 
                ")"}]}], ")"}]}], "\n", "            ", ",", "\n", 
            "            ", 
            RowBox[{"If", "[", 
             RowBox[{
              RowBox[{"A", " ", "==", " ", "4"}], ",", "\n", "              ", 
              RowBox[{
               RowBox[{"(", 
                RowBox[{
                 RowBox[{"a", "^", "2"}], " ", "+", " ", 
                 RowBox[{"r", " ", 
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{
                    RowBox[{"-", "2"}], " ", "M"}], " ", "+", " ", "r"}], 
                   ")"}]}]}], ")"}], " ", 
               RowBox[{
                RowBox[{"(", 
                 RowBox[{"2", " ", "+", " ", 
                  RowBox[{"\[CapitalDelta]\[Theta]", " ", 
                   RowBox[{"Cot", "[", "\[Theta]", "]"}]}]}], ")"}], " ", "/",
                 " ", 
                RowBox[{"(", 
                 RowBox[{"2", " ", 
                  RowBox[{"\[CapitalDelta]\[Theta]", "^", "2"}], " ", 
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"-", 
                    RowBox[{
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "+", "\n", 
                    "                 ", 
                    RowBox[{"r", "^", "2"}]}], ")"}], "^", "2"}]}], " ", "+", 
                    " ", 
                    RowBox[{
                    RowBox[{"a", "^", "2"}], " ", 
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "+", " ", 
                    RowBox[{"r", " ", 
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"-", "2"}], " ", "M"}], " ", "+", " ", "r"}], 
                    ")"}]}]}], ")"}], " ", 
                    RowBox[{
                    RowBox[{"Sin", "[", "\[Theta]", "]"}], "^", "2"}]}]}], 
                   ")"}]}], ")"}]}]}], "\n", "              ", ",", "\n", 
              "              ", 
              RowBox[{
               RowBox[{"-", 
                RowBox[{"(", 
                 RowBox[{
                  RowBox[{"a", "^", "2"}], " ", "+", " ", 
                  RowBox[{"r", " ", 
                   RowBox[{"(", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"-", "2"}], " ", "M"}], " ", "+", " ", "r"}], 
                    ")"}]}]}], ")"}]}], " ", 
               RowBox[{
                RowBox[{"(", 
                 RowBox[{
                  RowBox[{"-", "2"}], " ", "+", " ", 
                  RowBox[{"\[CapitalDelta]\[Theta]", " ", 
                   RowBox[{"Cot", "[", "\[Theta]", "]"}]}]}], ")"}], " ", "/",
                 " ", 
                RowBox[{"(", 
                 RowBox[{"2", " ", 
                  RowBox[{"\[CapitalDelta]\[Theta]", "^", "2"}], " ", 
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"-", 
                    RowBox[{
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{"a", "^", "2"}], "\n", "                 ", "+", 
                    " ", 
                    RowBox[{"r", "^", "2"}]}], ")"}], "^", "2"}]}], " ", "+", 
                    " ", 
                    RowBox[{
                    RowBox[{"a", "^", "2"}], " ", 
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "+", " ", 
                    RowBox[{"r", " ", 
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"-", "2"}], " ", "M"}], " ", "+", " ", "r"}], 
                    ")"}]}]}], ")"}], " ", 
                    RowBox[{
                    RowBox[{"Sin", "[", "\[Theta]", "]"}], "^", "2"}]}]}], 
                   ")"}]}], ")"}]}]}]}], "\n", "            ", "]"}]}], "\n", 
           "          ", "]"}]}], "\n", "        ", "]"}]}], "\n", "      ", 
       "]"}], "\n", "    ", "]"}]}]}], "\n", "  ", "]"}]}]], "Input",
 CellChangeTimes->{{3.841857696714251*^9, 3.8418576970595703`*^9}, 
   3.8418577786986647`*^9, {3.8418625240490217`*^9, 3.841862524164226*^9}, 
   3.8420547029441557`*^9, {3.842054966607977*^9, 3.842054984227322*^9}, {
   3.842055023276868*^9, 3.842055023699726*^9}, 
   3.84205522324529*^9},ExpressionUUID->"2853b76a-c8b5-4a75-a15f-\
d5adab19be56"],

Cell[BoxData["\[IndentingNewLine]"], "Input",
 CellChangeTimes->{
  3.842055538822794*^9},ExpressionUUID->"e250d9c9-2936-4378-8938-\
b020493b0bf9"],

Cell["This is the original function ", "Text",
 CellChangeTimes->{{3.842055598513238*^9, 
  3.8420556019055643`*^9}},ExpressionUUID->"d4ad0937-3b06-4111-a428-\
5e24705fc965"],

Cell[BoxData[
 RowBox[{"(*", 
  RowBox[{
   RowBox[{"getfxyCoeff", "[", 
    RowBox[{
    "r_", ",", "\[Theta]_", ",", "A_", ",", "\[CapitalDelta]rstar_", ",", 
     "\[CapitalDelta]\[Theta]_", ",", "m_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
      "\[CapitalDelta]", ",", "\[CapitalSigma]sq", ",", "box", ",", 
       "\[Delta]t2", ",", "\[Delta]t", ",", "\[Delta]rstar", ",", 
       "\[Delta]rstar2", ",", "\[Delta]\[Theta]", ",", "\[Delta]\[Theta]2", 
       ",", "none", ",", "fxy", ",", "fxyp", ",", "fxym", ",", "fxpy", ",", 
       "fxmy", ",", "\[Omega]", ",", "returnvalue"}], "}"}], ",", 
     RowBox[{
      RowBox[{"\[Omega]", "=", 
       RowBox[{"m", "*", "\[CapitalOmega]"}]}], ";", 
      RowBox[{
       RowBox[{"\[CapitalDelta]", "[", 
        RowBox[{"r", ",", "\[Theta]"}], "]"}], "=", " ", 
       RowBox[{
        SuperscriptBox["r", "2"], "-", 
        RowBox[{"2", " ", "M", " ", "r"}], " ", "+", 
        SuperscriptBox["a", "2"]}]}], ";", 
      RowBox[{
       RowBox[{"\[CapitalSigma]sq", "[", 
        RowBox[{"r", ",", "\[Theta]"}], "]"}], "=", " ", 
       RowBox[{
        SuperscriptBox[
         RowBox[{"(", 
          RowBox[{
           SuperscriptBox["r", "2"], "+", 
           SuperscriptBox["a", "2"]}], ")"}], "2"], "-", 
        RowBox[{
         SuperscriptBox["a", "2"], " ", 
         RowBox[{"(", " ", 
          RowBox[{
           SuperscriptBox["r", "2"], "-", 
           RowBox[{"2", " ", "M", " ", "r"}], " ", "+", 
           SuperscriptBox["a", "2"]}], ")"}], " ", 
         SuperscriptBox[
          RowBox[{"Sin", "[", "\[Theta]", "]"}], "2"]}]}]}], ";", 
      RowBox[{
       RowBox[{"box", "[", 
        RowBox[{"r", ",", "\[Theta]"}], "]"}], " ", "=", " ", 
       RowBox[{"(", 
        RowBox[{"\[Delta]t2", "+", 
         RowBox[{
          RowBox[{"(", 
           FractionBox[
            RowBox[{
            "4", " ", "\[ImaginaryI]", " ", "a", " ", "m", " ", "M", " ", 
             "r"}], 
            RowBox[{"\[CapitalSigma]sq", "[", 
             RowBox[{"r", ",", "\[Theta]"}], "]"}]], ")"}], "\[Delta]t"}], 
         "-", 
         RowBox[{
          RowBox[{"(", 
           FractionBox[
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{
               SuperscriptBox["r", "2"], "+", 
               SuperscriptBox["a", "2"]}], ")"}], "2"], 
            RowBox[{"\[CapitalSigma]sq", "[", 
             RowBox[{"r", ",", "\[Theta]"}], "]"}]], ")"}], 
          "\[Delta]rstar2"}], "-", 
         RowBox[{
          RowBox[{"(", 
           FractionBox[
            RowBox[{
             RowBox[{
             "2", " ", "\[ImaginaryI]", " ", "a", " ", "m", " ", "r", " ", 
              RowBox[{"(", 
               RowBox[{
                SuperscriptBox["r", "2"], "+", 
                SuperscriptBox["a", "2"]}], ")"}]}], "-", 
             RowBox[{"2", 
              SuperscriptBox["a", "2"], "\[CapitalDelta]"}]}], 
            RowBox[{"r", " ", 
             RowBox[{"\[CapitalSigma]sq", "[", 
              RowBox[{"r", ",", "\[Theta]"}], "]"}]}]], ")"}], 
          "\[Delta]rstar"}], "-", 
         RowBox[{
          RowBox[{"(", 
           FractionBox[
            RowBox[{"\[CapitalDelta]", "[", 
             RowBox[{"r", ",", "\[Theta]"}], "]"}], 
            RowBox[{"\[CapitalSigma]sq", "[", 
             RowBox[{"r", ",", "\[Theta]"}], "]"}]], ")"}], 
          "\[Delta]\[Theta]2"}], "-", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            FractionBox[
             RowBox[{"\[CapitalDelta]", "[", 
              RowBox[{"r", ",", "\[Theta]"}], "]"}], 
             RowBox[{"\[CapitalSigma]sq", "[", 
              RowBox[{"r", ",", "\[Theta]"}], "]"}]], 
            RowBox[{"Cot", "[", "\[Theta]", "]"}]}], ")"}], 
          "\[Delta]\[Theta]"}], "-", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            FractionBox[
             RowBox[{"\[CapitalDelta]", "[", 
              RowBox[{"r", ",", "\[Theta]"}], "]"}], 
             RowBox[{"\[CapitalSigma]sq", "[", 
              RowBox[{"r", ",", "\[Theta]"}], "]"}]], 
            RowBox[{"(", 
             RowBox[{
              FractionBox[
               RowBox[{"-", 
                SuperscriptBox["m", "2"]}], 
               SuperscriptBox[
                RowBox[{"Sin", "[", "\[Theta]", "]"}], "2"]], "-", 
              RowBox[{
               FractionBox[
                RowBox[{"2", "M"}], "r"], 
               RowBox[{"(", 
                RowBox[{"1", "-", 
                 FractionBox[
                  SuperscriptBox["a", "2"], 
                  RowBox[{"M", " ", "r"}]]}], ")"}]}], "-", 
              FractionBox[
               RowBox[{"2", " ", "\[ImaginaryI]", " ", "a", " ", "m", " "}], 
               "r"]}], ")"}]}], ")"}], "none"}]}], ")"}]}], " ", ";", 
      RowBox[{"(*", 
       RowBox[{"getting", " ", "rid", " ", "of", " ", 
        SuperscriptBox["e", 
         RowBox[{
          RowBox[{"-", "\[ImaginaryI]"}], " ", "\[Omega]", " ", "t"}]]}], 
       "*)"}], "\[IndentingNewLine]", 
      RowBox[{"\[Delta]t2", "=", 
       RowBox[{
        RowBox[{"-", 
         SuperscriptBox["\[Omega]", "2"]}], 
        SubscriptBox["\[Psi]", "ij"]}]}], ";", " ", 
      RowBox[{"\[Delta]t", "=", 
       RowBox[{
        RowBox[{"-", "\[ImaginaryI]"}], " ", "\[Omega]", " ", 
        SubscriptBox["\[Psi]", "ij"]}]}], ";", " ", 
      RowBox[{"\[Delta]rstar2", "=", 
       FractionBox[
        RowBox[{
         SubscriptBox["\[Psi]", "ipj"], "-", 
         RowBox[{"2", 
          SubscriptBox["\[Psi]", "ij"]}], "+", 
         SubscriptBox["\[Psi]", "imj"]}], 
        SuperscriptBox["\[CapitalDelta]rstar", "2"]]}], ";", " ", 
      RowBox[{"\[Delta]rstar", "=", 
       FractionBox[
        RowBox[{
         SubscriptBox["\[Psi]", "ipj"], "-", 
         SubscriptBox["\[Psi]", "imj"]}], 
        RowBox[{"2", " ", "\[CapitalDelta]rstar"}]]}], ";", " ", 
      RowBox[{"\[Delta]\[Theta]2", "=", 
       FractionBox[
        RowBox[{
         SubscriptBox["\[Psi]", "ijp"], "-", 
         RowBox[{"2", 
          SubscriptBox["\[Psi]", "ij"]}], "+", 
         SubscriptBox["\[Psi]", "ijm"]}], 
        SuperscriptBox["\[CapitalDelta]\[Theta]", "2"]]}], ";", " ", 
      RowBox[{"\[Delta]\[Theta]", "=", 
       FractionBox[
        RowBox[{
         SubscriptBox["\[Psi]", "ijp"], "-", 
         SubscriptBox["\[Psi]", "ijm"]}], 
        RowBox[{"2", " ", "\[CapitalDelta]\[Theta]"}]]}], ";", 
      RowBox[{"none", " ", "=", " ", 
       SubscriptBox["\[Psi]", "ij"]}], ";", " ", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"fxy", "[", 
        RowBox[{"r", ",", "\[Theta]"}], "]"}], "=", 
       RowBox[{
        RowBox[{"Coefficient", "[", 
         RowBox[{
          RowBox[{"box", "[", 
           RowBox[{"r", ",", "\[Theta]"}], "]"}], ",", 
          SubscriptBox["\[Psi]", "ij"]}], "]"}], "//", "Simplify"}]}], ";", 
      RowBox[{
       RowBox[{"fxpy", "[", 
        RowBox[{"r", ",", "\[Theta]"}], "]"}], "=", 
       RowBox[{
        RowBox[{"Coefficient", "[", 
         RowBox[{
          RowBox[{"box", "[", 
           RowBox[{"r", ",", "\[Theta]"}], "]"}], ",", 
          SubscriptBox["\[Psi]", "ipj"]}], "]"}], "//", "Simplify"}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"fxmy", "[", 
        RowBox[{"r", ",", "\[Theta]"}], "]"}], "=", 
       RowBox[{
        RowBox[{"Coefficient", "[", 
         RowBox[{
          RowBox[{"box", "[", 
           RowBox[{"r", ",", "\[Theta]"}], "]"}], ",", 
          SubscriptBox["\[Psi]", "imj"]}], "]"}], "//", "Simplify"}]}], ";", 
      RowBox[{
       RowBox[{"fxyp", "[", 
        RowBox[{"r", ",", "\[Theta]"}], "]"}], "=", 
       RowBox[{
        RowBox[{"Coefficient", "[", 
         RowBox[{
          RowBox[{"box", "[", 
           RowBox[{"r", ",", "\[Theta]"}], "]"}], ",", 
          SubscriptBox["\[Psi]", "ijp"]}], "]"}], "//", "Simplify"}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"fxym", "[", 
        RowBox[{"r", ",", "\[Theta]"}], "]"}], "=", 
       RowBox[{
        RowBox[{"Coefficient", "[", 
         RowBox[{
          RowBox[{"box", "[", 
           RowBox[{"r", ",", "\[Theta]"}], "]"}], ",", 
          SubscriptBox["\[Psi]", "ijm"]}], "]"}], "//", "Simplify"}]}], ";", 
      RowBox[{"returnvalue", " ", "=", 
       RowBox[{"If", "[", 
        RowBox[{
         RowBox[{"A", "\[Equal]", "1"}], ",", 
         RowBox[{"fxy", "[", 
          RowBox[{"r", ",", "\[Theta]"}], "]"}], ",", 
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{"A", "\[Equal]", "2"}], ",", 
           RowBox[{"fxpy", "[", 
            RowBox[{"r", ",", "\[Theta]"}], "]"}], ",", 
           RowBox[{"If", "[", 
            RowBox[{
             RowBox[{"A", "\[Equal]", "3"}], ",", 
             RowBox[{"fxmy", "[", 
              RowBox[{"r", ",", "\[Theta]"}], "]"}], ",", 
             RowBox[{"If", "[", 
              RowBox[{
               RowBox[{"A", "\[Equal]", "4"}], ",", 
               RowBox[{"fxyp", "[", 
                RowBox[{"r", ",", "\[Theta]"}], "]"}], ",", 
               RowBox[{"fxym", "[", 
                RowBox[{"r", ",", "\[Theta]"}], "]"}]}], "]"}]}], "]"}]}], 
          "]"}]}], "]"}]}], ";", "returnvalue"}]}], "]"}]}], "*)"}]], "Input",\

 CellChangeTimes->{{3.842055027224987*^9, 3.842055029517643*^9}, {
  3.8420556054977703`*^9, 
  3.842055606153452*^9}},ExpressionUUID->"65465a1b-ab93-409d-b0b1-\
7b5ef9f3b93b"]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[StyleBox["Calculating Source Matrix ",
 FontSize->14]], "Section",
 CellChangeTimes->{{3.8420556199096127`*^9, 
  3.842055628418241*^9}},ExpressionUUID->"8c10d703-98ed-42ee-a933-\
6b00581e0fd4"],

Cell[TextData[{
 "Here, I\[CloseCurlyQuote]m calculating the Source Matrix on r-\[Theta] \
plane and then making it to one array. \nThis source matrix includes the \
effective source and also it takes into consideration the \
\[OpenCurlyDoubleQuote]jump\[CloseCurlyDoubleQuote] between full filed mode \
",
 Cell[BoxData[
  FormBox[
   SuperscriptBox["\[CapitalPsi]", "m"], TraditionalForm]],
  FormatType->TraditionalForm,ExpressionUUID->
  "600aff1f-8fff-4aba-95bb-45e3068f8d78"],
 " and residual field mode ",
 Cell[BoxData[
  FormBox[
   SubsuperscriptBox["\[CapitalPsi]", "R", "m"], TraditionalForm]],
  FormatType->TraditionalForm,ExpressionUUID->
  "1cb66ae3-3fbf-4806-87f2-35a91db60928"],
 " across the ",
 StyleBox["worldtube. ",
  IgnoreSpellCheck->True]
}], "Text",
 CellChangeTimes->{{3.8420556812011623`*^9, 3.842055732719984*^9}, {
  3.8420558251119127`*^9, 
  3.8420559898181543`*^9}},ExpressionUUID->"1fa7bd66-d626-4ffe-9179-\
25848ed43ae5"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SourceMatrix", "[", 
   RowBox[{
   "n_", ",", " ", "m_", ",", " ", "a_", ",", " ", "r0_", ",", " ", 
    "rminapp_", ",", " ", "rmaxapp_", ",", " ", "d_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
     "rplus", ",", "rminus", ",", "rtorstar", ",", "r0star", ",", "rsmin", 
      ",", "rsmax", ",", "guess", ",", "rstartor", ",", "listr", ",", 
      "listrsource", ",", "\[Theta]smin", ",", "\[Theta]smax", ",", "imax", 
      ",", "jmax", ",", "rsourcestart", ",", "rsourceend", ",", "listSeff1", 
      ",", "SourceMatrix1", ",", "i", ",", "j", ",", "r", ",", "LeftBC", ",", 
      "RightBC", ",", "TopBC", ",", "BottomBC", ",", "SecondTopBC", ",", 
      "SecondBottomBC", ",", "SecondLeftBC", ",", "SourceBC1", ",", 
      "SecondRightBC", ",", "Sourcelist", ",", "\[CapitalDelta]\[Theta]", ",",
       "\[Theta]sourcegrid", ",", "l", ",", "\[CapitalDelta]rstar", ",", 
      "rmatrixfactorminus", ",", "rmatrixfactorplus", ",", "rmin", ",", 
      "rmax", ",", "\[Theta]start", ",", "\[Theta]end"}], "}"}], ",", 
    RowBox[{
     RowBox[{"\[CapitalDelta]\[Theta]", "=", 
      RowBox[{"\[Pi]", "/", 
       RowBox[{"(", 
        RowBox[{"5", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"2", "n"}], "+", "1"}], ")"}]}], ")"}]}]}], ";", 
     RowBox[{"\[Theta]sourcegrid", "=", 
      RowBox[{
       RowBox[{"2", "n"}], "+", "1"}]}], ";", 
     RowBox[{"l", "=", 
      RowBox[{
       RowBox[{"3", "n"}], "+", "1"}]}], ";", "\n", 
     RowBox[{"\[CapitalDelta]rstar", "=", 
      RowBox[{"d", "/", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"2", "l"}], "+", "1"}], ")"}]}]}], ";", "\n", 
     RowBox[{"rplus", "=", 
      RowBox[{"M", "+", 
       RowBox[{"Sqrt", "[", 
        RowBox[{
         RowBox[{"M", "^", "2"}], "-", 
         RowBox[{"a", "^", "2"}]}], "]"}]}]}], ";", 
     RowBox[{"rminus", "=", 
      RowBox[{"M", "-", 
       RowBox[{"Sqrt", "[", 
        RowBox[{
         RowBox[{"M", "^", "2"}], "-", 
         RowBox[{"a", "^", "2"}]}], "]"}]}]}], ";", 
     RowBox[{
      RowBox[{"rtorstar", "[", "r_", "]"}], "=", 
      RowBox[{"r", "+", 
       RowBox[{
        RowBox[{
         RowBox[{"(", 
          RowBox[{"2", "M"}], " ", ")"}], "/", 
         RowBox[{"(", 
          RowBox[{"rplus", " ", "-", " ", "rminus"}], ")"}]}], " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"rplus", " ", 
           RowBox[{"Log", "[", 
            RowBox[{
             RowBox[{"(", 
              RowBox[{"r", "-", "rplus"}], ")"}], "/", 
             RowBox[{"(", 
              RowBox[{"2", "M"}], ")"}]}], "]"}]}], "-", 
          RowBox[{"rminus", " ", 
           RowBox[{"Log", "[", 
            RowBox[{
             RowBox[{"(", 
              RowBox[{"r", "-", "rminus"}], ")"}], "/", 
             RowBox[{"(", 
              RowBox[{"2", "M"}], ")"}]}], "]"}]}]}], ")"}]}]}]}], ";", "\n", 
     
     RowBox[{"r0star", "=", 
      RowBox[{"rtorstar", "[", "r0", "]"}]}], ";", "\n", 
     RowBox[{"rsmin", "=", 
      RowBox[{"r0star", "-", 
       RowBox[{"\[CapitalDelta]rstar", "/", "2"}], "-", 
       RowBox[{"l", "*", "\[CapitalDelta]rstar"}]}]}], ";", 
     RowBox[{"rsmax", "=", 
      RowBox[{"r0star", "+", 
       RowBox[{"\[CapitalDelta]rstar", "/", "2"}], "+", 
       RowBox[{"l", "*", "\[CapitalDelta]rstar"}]}]}], ";", "\n", 
     RowBox[{"\[Theta]smin", "=", 
      RowBox[{
       RowBox[{"\[Pi]", "/", "2"}], "-", 
       RowBox[{"\[CapitalDelta]\[Theta]", "/", "2"}], "-", 
       RowBox[{"n", "*", "\[CapitalDelta]\[Theta]"}]}]}], ";", 
     RowBox[{"\[Theta]smax", "=", 
      RowBox[{
       RowBox[{"\[Pi]", "/", "2"}], "+", 
       RowBox[{"\[CapitalDelta]\[Theta]", "/", "2"}], "+", 
       RowBox[{"n", "*", "\[CapitalDelta]\[Theta]"}]}]}], ";", "\n", 
     RowBox[{"rmatrixfactorminus", "=", 
      RowBox[{
       RowBox[{"Floor", "[", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"rsmin", "-", "rminapp"}], ")"}], "/", "d"}], "]"}], "+", 
       "1"}]}], ";", "\n", 
     RowBox[{"rmatrixfactorplus", "=", 
      RowBox[{
       RowBox[{"Floor", "[", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"rmaxapp", "-", "rsmax"}], ")"}], "/", "d"}], "]"}], "+", 
       "1"}]}], ";", "\n", 
     RowBox[{"rmin", "=", 
      RowBox[{"rsmin", "-", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"rmatrixfactorminus", "-", "1"}], ")"}], "*", "d"}]}]}], ";",
      "\n", 
     RowBox[{"rmax", "=", 
      RowBox[{
       RowBox[{
        RowBox[{"(", 
         RowBox[{"rmatrixfactorplus", "-", "1"}], ")"}], "*", "d"}], "+", 
       "rsmax"}]}], ";", "\n", 
     RowBox[{"\[Theta]start", "=", 
      RowBox[{"\[Theta]smin", "/", "\[CapitalDelta]\[Theta]"}]}], ";", 
     RowBox[{"\[Theta]end", "=", 
      RowBox[{"\[Theta]smax", "/", "\[CapitalDelta]\[Theta]"}]}], ";", "\n", 
     "\n", 
     RowBox[{"imax", "=", 
      RowBox[{"Round", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"(", 
          RowBox[{"rmax", "-", "rmin"}], ")"}], "/", "\[CapitalDelta]rstar"}],
         "+", "1"}], "]"}]}], ";", 
     RowBox[{"jmax", "=", 
      RowBox[{"Floor", "[", 
       RowBox[{
        RowBox[{"\[Pi]", "/", "\[CapitalDelta]\[Theta]"}], "+", "1"}], 
       "]"}]}], ";", "\n", 
     RowBox[{
      RowBox[{"guess", "[", "rstar_", "]"}], ":=", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"rstar", "<=", " ", 
         RowBox[{"-", "2"}]}], ",", 
        RowBox[{"rplus", "+", 
         RowBox[{"2", "*", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"1", "-", 
             RowBox[{"a", "^", "2"}]}], ")"}], "^", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"1", "/", "rplus"}], "-", 
             RowBox[{"1", "/", "2"}]}], ")"}]}], " ", 
          RowBox[{"Exp", "[", 
           RowBox[{
            RowBox[{"(", 
             RowBox[{
              RowBox[{"a", "^", "2"}], "-", "rplus", "+", 
              RowBox[{
               RowBox[{"(", 
                RowBox[{"rplus", "-", "1"}], ")"}], "*", "rstar"}]}], ")"}], 
            "/", "rplus"}], "]"}]}]}], ",", 
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{
           RowBox[{"-", "2"}], "<", "rstar", "<=", " ", "1000"}], ",", 
          RowBox[{"rplus", "+", 
           RowBox[{"2", 
            RowBox[{"(", 
             RowBox[{"ProductLog", "[", 
              RowBox[{"Exp", "[", 
               RowBox[{
                RowBox[{"1", "/", "2"}], " ", 
                RowBox[{"(", 
                 RowBox[{"rstar", "-", "rplus"}], ")"}]}], "]"}], "]"}], 
             ")"}]}]}], ",", 
          RowBox[{"rstar", "+", "rplus"}]}], "]"}]}], "]"}]}], ";", "\n", 
     RowBox[{
      RowBox[{"rstartor", "[", "rstar_", "]"}], ":=", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"rstar", "<", 
         RowBox[{"-", "50"}]}], ",", 
        RowBox[{"guess", "[", "rstar", "]"}], ",", 
        RowBox[{"r", "/.", 
         RowBox[{"FindRoot", "[", 
          RowBox[{
           RowBox[{
            RowBox[{
             RowBox[{"rtorstar", "[", "r", "]"}], "-", "rstar"}], "==", "0"}],
            ",", 
           RowBox[{"{", 
            RowBox[{"r", ",", 
             RowBox[{"guess", "[", "rstar", "]"}]}], "}"}], ",", 
           RowBox[{"Method", "->", "\"\<Newton\>\""}]}], "]"}]}]}], "]"}]}], 
     ";", "\n", 
     RowBox[{"listr", "=", 
      RowBox[{
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{"Re", "[", 
          RowBox[{"rstartor", "[", "rstar", "]"}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{
          "rstar", ",", "rmin", ",", "rmax", ",", "\[CapitalDelta]rstar"}], 
          "}"}]}], "]"}], "//", "Quiet"}]}], ";", 
     RowBox[{"listrsource", "=", 
      RowBox[{
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{"Re", "[", 
          RowBox[{"rstartor", "[", "rstar", "]"}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{
          "rstar", ",", "rsmin", ",", "rsmax", ",", "\[CapitalDelta]rstar"}], 
          "}"}]}], "]"}], "//", "Quiet"}]}], ";", "\n", 
     RowBox[{"rsourcestart", "=", 
      RowBox[{"Floor", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"(", 
          RowBox[{"rsmin", "-", "rmin"}], ")"}], "/", 
         "\[CapitalDelta]rstar"}], "+", "1"}], "]"}]}], ";", 
     RowBox[{"rsourceend", "=", 
      RowBox[{"rsourcestart", "+", 
       RowBox[{"Length", "[", "listrsource", "]"}], "-", "1"}]}], ";", "\n", 
     RowBox[{"listSeff1", "=", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{"scaledSeffm", "[", 
         RowBox[{"m", ",", 
          RowBox[{"listrsource", "[", 
           RowBox[{"[", "i", "]"}], "]"}], ",", 
          RowBox[{"N", "[", "j", "]"}]}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"i", ",", "1", ",", 
          RowBox[{"Length", "[", "listrsource", "]"}]}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{
         "j", ",", "\[Theta]smin", ",", "\[Theta]smax", ",", 
          "\[CapitalDelta]\[Theta]"}], "}"}]}], "]"}]}], ";", "\n", "\n", 
     RowBox[{"SourceMatrix1", "=", 
      RowBox[{"SparseArray", "[", 
       RowBox[{
        RowBox[{"Flatten", "[", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"{", 
             RowBox[{
              RowBox[{"i", "+", "rsourcestart", "-", "1"}], ",", 
              RowBox[{"j", "+", "\[Theta]start"}]}], "}"}], "->", 
            RowBox[{"listSeff1", "[", 
             RowBox[{"[", 
              RowBox[{"i", ",", "j"}], "]"}], "]"}]}], ",", 
           RowBox[{"{", 
            RowBox[{"i", ",", "1", ",", 
             RowBox[{"Length", "[", "listrsource", "]"}]}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"j", ",", "1", ",", 
             RowBox[{"\[Theta]end", "-", "\[Theta]start", "+", "1"}]}], 
            "}"}]}], "]"}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"imax", ",", "jmax"}], "}"}]}], "]"}]}], ";", 
     RowBox[{"LeftBC", ":=", 
      RowBox[{"SparseArray", "[", 
       RowBox[{
        RowBox[{"Flatten", "[", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"{", 
             RowBox[{
              RowBox[{"i2", "+", "rsourcestart", "-", "1"}], ",", 
              "\[Theta]start"}], "}"}], "->", " ", 
            RowBox[{
             RowBox[{"-", 
              RowBox[{"getfxyCoeff", "[", 
               RowBox[{
                RowBox[{"listrsource", "[", 
                 RowBox[{"[", "i2", "]"}], "]"}], ",", 
                RowBox[{"N", "[", 
                 RowBox[{"\[Theta]smin", "-", "\[CapitalDelta]\[Theta]"}], 
                 "]"}], ",", "4", ",", "\[CapitalDelta]rstar", ",", 
                "\[CapitalDelta]\[Theta]", ",", "m"}], "]"}]}], " ", 
             RowBox[{"listrsource", "[", 
              RowBox[{"[", "i2", "]"}], "]"}], " ", 
             RowBox[{"scaled\[CapitalPhi]Pm", "[", 
              RowBox[{"m", ",", 
               RowBox[{"listrsource", "[", 
                RowBox[{"[", "i2", "]"}], "]"}], ",", 
               RowBox[{"N", "[", "\[Theta]smin", "]"}]}], "]"}]}]}], ",", 
           RowBox[{"{", 
            RowBox[{"i2", ",", "1", ",", 
             RowBox[{"Length", "[", "listrsource", "]"}]}], "}"}]}], "]"}], 
         "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"imax", ",", "jmax"}], "}"}]}], "]"}]}], ";", 
     RowBox[{"SecondLeftBC", ":=", 
      RowBox[{"SparseArray", "[", 
       RowBox[{
        RowBox[{"Flatten", "[", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"{", 
             RowBox[{
              RowBox[{"i2", "+", "rsourcestart", "-", "1"}], ",", 
              RowBox[{"\[Theta]start", "+", "1"}]}], "}"}], "->", " ", 
            RowBox[{
             RowBox[{"getfxyCoeff", "[", 
              RowBox[{
               RowBox[{"listrsource", "[", 
                RowBox[{"[", "i2", "]"}], "]"}], ",", 
               RowBox[{"N", "[", "\[Theta]smin", "]"}], ",", "5", ",", 
               "\[CapitalDelta]rstar", ",", "\[CapitalDelta]\[Theta]", ",", 
               "m"}], "]"}], " ", 
             RowBox[{"listrsource", "[", 
              RowBox[{"[", "i2", "]"}], "]"}], " ", 
             RowBox[{"scaled\[CapitalPhi]Pm", "[", 
              RowBox[{"m", ",", 
               RowBox[{"listrsource", "[", 
                RowBox[{"[", "i2", "]"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{"\[Theta]smin", "-", "\[CapitalDelta]\[Theta]"}], 
                "]"}]}], "]"}]}]}], ",", 
           RowBox[{"{", 
            RowBox[{"i2", ",", "1", ",", 
             RowBox[{"Length", "[", "listrsource", "]"}]}], "}"}]}], "]"}], 
         "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"imax", ",", "jmax"}], "}"}]}], "]"}]}], ";", 
     RowBox[{"RightBC", ":=", 
      RowBox[{"SparseArray", "[", 
       RowBox[{
        RowBox[{"Flatten", "[", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"{", 
             RowBox[{
              RowBox[{"i1", "+", "rsourcestart", "-", "1"}], ",", 
              RowBox[{"\[Theta]end", "+", "2"}]}], "}"}], "->", " ", 
            RowBox[{
             RowBox[{"-", 
              RowBox[{"getfxyCoeff", " ", "[", 
               RowBox[{
                RowBox[{"listrsource", "[", 
                 RowBox[{"[", "i1", "]"}], "]"}], ",", 
                RowBox[{"N", "[", 
                 RowBox[{"\[Theta]smax", "+", "\[CapitalDelta]\[Theta]"}], 
                 "]"}], ",", "5", ",", "\[CapitalDelta]rstar", ",", 
                "\[CapitalDelta]\[Theta]", ",", "m"}], "]"}]}], 
             RowBox[{"listrsource", "[", 
              RowBox[{"[", "i1", "]"}], "]"}], " ", 
             RowBox[{"scaled\[CapitalPhi]Pm", "[", 
              RowBox[{"m", ",", 
               RowBox[{"listrsource", "[", 
                RowBox[{"[", "i1", "]"}], "]"}], ",", 
               RowBox[{"N", "[", "\[Theta]smax", "]"}]}], "]"}]}]}], ",", 
           RowBox[{"{", 
            RowBox[{"i1", ",", "1", ",", 
             RowBox[{"Length", "[", "listrsource", "]"}]}], "}"}]}], "]"}], 
         "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"imax", ",", "jmax"}], "}"}]}], "]"}]}], ";", "\n", 
     RowBox[{"SecondRightBC", ":=", 
      RowBox[{"SparseArray", "[", 
       RowBox[{
        RowBox[{"Flatten", "[", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"{", 
             RowBox[{
              RowBox[{"i1", "+", "rsourcestart", "-", "1"}], ",", 
              RowBox[{"\[Theta]end", "+", "1"}]}], "}"}], "->", " ", 
            RowBox[{
             RowBox[{"getfxyCoeff", "[", 
              RowBox[{
               RowBox[{"listrsource", "[", 
                RowBox[{"[", "i1", "]"}], "]"}], ",", 
               RowBox[{"N", "[", "\[Theta]smax", "]"}], ",", "4", ",", 
               "\[CapitalDelta]rstar", ",", "\[CapitalDelta]\[Theta]", ",", 
               "m"}], "]"}], " ", 
             RowBox[{"listrsource", "[", 
              RowBox[{"[", "i1", "]"}], "]"}], " ", 
             RowBox[{"scaled\[CapitalPhi]Pm", "[", 
              RowBox[{"m", ",", 
               RowBox[{"listrsource", "[", 
                RowBox[{"[", "i1", "]"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{"\[Theta]smax", "+", "\[CapitalDelta]\[Theta]"}], 
                "]"}]}], "]"}]}]}], ",", 
           RowBox[{"{", 
            RowBox[{"i1", ",", "1", ",", 
             RowBox[{"Length", "[", "listrsource", "]"}]}], "}"}]}], "]"}], 
         "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"imax", ",", "jmax"}], "}"}]}], "]"}]}], ";", 
     RowBox[{"TopBC", ":=", 
      RowBox[{"SparseArray", "[", 
       RowBox[{
        RowBox[{"Flatten", "[", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"{", 
             RowBox[{
              RowBox[{"rsourcestart", "-", "1"}], ",", 
              RowBox[{"\[Theta]start", "+", "j"}]}], "}"}], "->", " ", 
            RowBox[{
             RowBox[{"-", 
              RowBox[{"getfxyCoeff", " ", "[", 
               RowBox[{
                RowBox[{"listr", "[", 
                 RowBox[{"[", 
                  RowBox[{"rsourcestart", "-", "1"}], "]"}], "]"}], ",", 
                RowBox[{"N", "[", 
                 RowBox[{"\[Theta]smin", "+", 
                  RowBox[{"\[CapitalDelta]\[Theta]", "*", 
                   RowBox[{"(", 
                    RowBox[{"j", "-", "1"}], ")"}]}]}], "]"}], ",", "2", ",", 
                "\[CapitalDelta]rstar", ",", "\[CapitalDelta]\[Theta]", ",", 
                "m"}], "]"}]}], 
             RowBox[{"listr", "[", 
              RowBox[{"[", "rsourcestart", "]"}], "]"}], " ", 
             RowBox[{"scaled\[CapitalPhi]Pm", "[", 
              RowBox[{"m", ",", 
               RowBox[{"listr", "[", 
                RowBox[{"[", "rsourcestart", "]"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{"\[Theta]smin", "+", 
                 RowBox[{"\[CapitalDelta]\[Theta]", "*", 
                  RowBox[{"(", 
                   RowBox[{"j", "-", "1"}], ")"}]}]}], "]"}]}], "]"}]}]}], 
           ",", 
           RowBox[{"{", 
            RowBox[{"j", ",", "1", ",", 
             RowBox[{"\[Theta]end", "-", "\[Theta]start", "+", "1"}]}], 
            "}"}]}], "]"}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"imax", ",", "jmax"}], "}"}]}], "]"}]}], ";", "\n", 
     RowBox[{"SecondTopBC", ":=", 
      RowBox[{"SparseArray", "[", 
       RowBox[{
        RowBox[{"Flatten", "[", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"{", 
             RowBox[{"rsourcestart", ",", 
              RowBox[{"\[Theta]start", "+", "j"}]}], "}"}], "->", " ", 
            RowBox[{
             RowBox[{"getfxyCoeff", "[", 
              RowBox[{
               RowBox[{"listr", "[", 
                RowBox[{"[", "rsourcestart", "]"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{"\[Theta]smin", "+", 
                 RowBox[{"\[CapitalDelta]\[Theta]", "*", 
                  RowBox[{"(", 
                   RowBox[{"j", "-", "1"}], ")"}]}]}], "]"}], ",", "3", ",", 
               "\[CapitalDelta]rstar", ",", "\[CapitalDelta]\[Theta]", ",", 
               "m"}], "]"}], " ", 
             RowBox[{"listr", "[", 
              RowBox[{"[", 
               RowBox[{"rsourcestart", "-", "1"}], "]"}], "]"}], " ", 
             RowBox[{"scaled\[CapitalPhi]Pm", "[", 
              RowBox[{"m", ",", 
               RowBox[{"listr", "[", 
                RowBox[{"[", 
                 RowBox[{"rsourcestart", "-", "1"}], "]"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{"\[Theta]smin", "+", 
                 RowBox[{"\[CapitalDelta]\[Theta]", "*", 
                  RowBox[{"(", 
                   RowBox[{"j", "-", "1"}], ")"}]}]}], "]"}]}], "]"}]}]}], 
           ",", 
           RowBox[{"{", 
            RowBox[{"j", ",", "1", ",", 
             RowBox[{"\[Theta]end", "-", "\[Theta]start", "+", "1"}]}], 
            "}"}]}], "]"}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"imax", ",", "jmax"}], "}"}]}], "]"}]}], ";", 
     RowBox[{"BottomBC", ":=", 
      RowBox[{"SparseArray", "[", 
       RowBox[{
        RowBox[{"Flatten", "[", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"{", 
             RowBox[{
              RowBox[{"rsourceend", "+", "1"}], ",", 
              RowBox[{"\[Theta]start", "+", "j"}]}], "}"}], "->", " ", 
            RowBox[{
             RowBox[{"-", 
              RowBox[{"getfxyCoeff", "[", 
               RowBox[{
                RowBox[{"listr", "[", 
                 RowBox[{"[", 
                  RowBox[{"rsourceend", "+", "1"}], "]"}], "]"}], ",", 
                RowBox[{"N", "[", 
                 RowBox[{"\[Theta]smin", "+", 
                  RowBox[{"\[CapitalDelta]\[Theta]", "*", 
                   RowBox[{"(", 
                    RowBox[{"j", "-", "1"}], ")"}]}]}], "]"}], ",", "3", ",", 
                "\[CapitalDelta]rstar", ",", "\[CapitalDelta]\[Theta]", ",", 
                "m"}], "]"}]}], " ", 
             RowBox[{"listr", "[", 
              RowBox[{"[", "rsourceend", "]"}], "]"}], " ", 
             RowBox[{"scaled\[CapitalPhi]Pm", "[", 
              RowBox[{"m", ",", 
               RowBox[{"listr", "[", 
                RowBox[{"[", "rsourceend", "]"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{"\[Theta]smin", "+", 
                 RowBox[{"\[CapitalDelta]\[Theta]", "*", 
                  RowBox[{"(", 
                   RowBox[{"j", "-", "1"}], ")"}]}]}], "]"}]}], "]"}]}]}], 
           ",", 
           RowBox[{"{", 
            RowBox[{"j", ",", "1", ",", 
             RowBox[{"\[Theta]end", "-", "\[Theta]start", "+", "1"}]}], 
            "}"}]}], "]"}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"imax", ",", "jmax"}], "}"}]}], "]"}]}], ";", 
     RowBox[{"SecondBottomBC", ":=", 
      RowBox[{"SparseArray", "[", 
       RowBox[{
        RowBox[{"Flatten", "[", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"{", 
             RowBox[{"rsourceend", ",", 
              RowBox[{"\[Theta]start", "+", "j"}]}], "}"}], "->", " ", 
            RowBox[{
             RowBox[{"getfxyCoeff", "[", 
              RowBox[{
               RowBox[{"listr", "[", 
                RowBox[{"[", "rsourceend", "]"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{"\[Theta]smin", "+", 
                 RowBox[{"\[CapitalDelta]\[Theta]", "*", 
                  RowBox[{"(", 
                   RowBox[{"j", "-", "1"}], ")"}]}]}], "]"}], ",", "2", ",", 
               "\[CapitalDelta]rstar", ",", "\[CapitalDelta]\[Theta]", ",", 
               "m"}], "]"}], " ", 
             RowBox[{"listr", "[", 
              RowBox[{"[", 
               RowBox[{"rsourceend", "+", "1"}], "]"}], "]"}], " ", 
             RowBox[{"scaled\[CapitalPhi]Pm", "[", 
              RowBox[{"m", ",", 
               RowBox[{"listr", "[", 
                RowBox[{"[", 
                 RowBox[{"rsourceend", "+", "1"}], "]"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{"\[Theta]smin", "+", 
                 RowBox[{"\[CapitalDelta]\[Theta]", "*", 
                  RowBox[{"(", 
                   RowBox[{"j", "-", "1"}], ")"}]}]}], "]"}]}], "]"}]}]}], 
           ",", 
           RowBox[{"{", 
            RowBox[{"j", ",", "1", ",", 
             RowBox[{"\[Theta]end", "-", "\[Theta]start", "+", "1"}]}], 
            "}"}]}], "]"}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"imax", ",", "jmax"}], "}"}]}], "]"}]}], ";", "\n", 
     RowBox[{"SourceBC1", "=", 
      RowBox[{
      "LeftBC", "+", "SourceMatrix1", "+", "SecondLeftBC", "+", "RightBC", 
       "+", "SecondRightBC", "+", "TopBC", "+", "SecondTopBC", "+", 
       "BottomBC", "+", "SecondBottomBC"}]}], ";", "\n", 
     RowBox[{"Sourcelist", "=", 
      RowBox[{"Flatten", "[", 
       RowBox[{"ArrayReshape", "[", 
        RowBox[{"SourceBC1", ",", 
         RowBox[{"{", 
          RowBox[{"1", ",", 
           RowBox[{"imax", "*", "jmax"}]}], "}"}]}], "]"}], "]"}]}], ";", 
     "\n", "Sourcelist"}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.841857714088241*^9, 3.841857740685313*^9}, {
   3.841858659828484*^9, 3.841858661173296*^9}, {3.841862302759995*^9, 
   3.841862369077269*^9}, {3.8418624442121687`*^9, 3.84186244637428*^9}, {
   3.8418625175923977`*^9, 3.841862517972275*^9}, {3.84186846684667*^9, 
   3.841868467959531*^9}, {3.8419698199637423`*^9, 3.8419698229674597`*^9}, {
   3.841977405726336*^9, 3.841977409665996*^9}, {3.841978474701688*^9, 
   3.841978476449011*^9}, {3.841984034370166*^9, 3.841984050188118*^9}, {
   3.842042896537689*^9, 3.8420428980995293`*^9}, {3.842055227019113*^9, 
   3.842055243546421*^9}, 
   3.8420556482756157`*^9},ExpressionUUID->"ce3fdf9e-9c4f-49a1-aec3-\
2b152c41dbf3"]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[StyleBox["Calculating  Coupling Matrix ",
 FontSize->14]], "Section",
 CellChangeTimes->{{3.841951133141123*^9, 3.841951137585634*^9}, {
  3.842056011168805*^9, 
  3.842056021383404*^9}},ExpressionUUID->"c1bb7be7-b7ef-469c-9a37-\
d6e95723db1a"],

Cell[TextData[{
 "Here, I\[CloseCurlyQuote]m calculating the Coupling Matrix \nBoundary \
condition at ",
 Cell[BoxData[
  FormBox[
   SubsuperscriptBox["r", "max", "*"], TraditionalForm]],
  FormatType->TraditionalForm,ExpressionUUID->
  "33234ce5-dd40-4b40-b86e-66878302ca8b"],
 " has the error of ",
 Cell[BoxData[
  FormBox[
   SuperscriptBox[
    RowBox[{"(", 
     FractionBox["1", 
      SubsuperscriptBox["r", "max", "*"]], ")"}], 
    RowBox[{"4", " "}]], TraditionalForm]],
  FormatType->TraditionalForm,ExpressionUUID->
  "8e6958f4-2f10-4ae9-b73d-ffd0efdfb12b"],
 " ",
 Cell[BoxData[
  FormBox[
   SuperscriptBox["e", 
    RowBox[{"i\[Omega]", " ", 
     SubsuperscriptBox["r", "max", "*"]}]], TraditionalForm]],
  FormatType->TraditionalForm,ExpressionUUID->
  "ad941a83-f332-4630-a33f-97f5117d6321"],
 " "
}], "Text",
 CellChangeTimes->{{3.842056044729495*^9, 3.842056065038423*^9}, {
  3.842056276777403*^9, 3.842056279584795*^9}, {3.842056331570265*^9, 
  3.842056369895813*^9}, {3.842056430200241*^9, 
  3.8420565090320597`*^9}},ExpressionUUID->"b62b6f9d-e93c-4a38-9d15-\
f370d05ded10"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"CouplingMatrix", "[", 
   RowBox[{
   "n_", ",", " ", "m_", ",", " ", "a_", ",", " ", "r0_", ",", " ", 
    "rminapp_", ",", " ", "rmaxapp_", ",", " ", "d_"}], "]"}], " ", ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
     "rplus", ",", "rminus", ",", "rtorstar", ",", "r0star", ",", "rstarmin1",
       ",", "rstarmax1", ",", "rsmin1", ",", "rsmax1", ",", "\[Theta]smin", 
      ",", "\[Theta]smax", ",", "imax", ",", "jmax", ",", "listr1", ",", 
      "listrsource1", ",", "MxBC", ",", "rstartor", ",", "listr", ",", 
      "listrsource", ",", "guess", ",", "\[Omega]", ",", "rsmin", ",", 
      "rsmax", ",", "rmin", ",", "rmax", ",", "\[CapitalDelta]\[Theta]", ",", 
      "\[Theta]sourcegrid", ",", "l", ",", "\[CapitalDelta]rstar", ",", 
      "rsourcegrid", ",", "rmatrixfactorminus", ",", "rmatrixfactorplus", ",",
       "listTheta", ",", " ", "diag", ",", " ", "rightDiag", ",", " ", 
      "leftDiag", ",", "\n", "     ", "rightSkipDiag", ",", " ", 
      "leftSkipDiag", ",", "xBC1", ",", "xBC2", ",", "xBC3", ",", "yBC1", ",",
       "yBC2", ",", "yBC3", ",", "xBC1min", ",", "xBC1max", ",", "xBC2min", 
      ",", "xBC2max", ",", "xBC3min", ",", "xBC3max", ",", "xBC4max", ",", 
      "xBC5max", ",", "listr2"}], "}"}], ",", 
    RowBox[{
     RowBox[{"\[Omega]", "=", 
      RowBox[{"m", "*", "\[CapitalOmega]"}]}], ";", 
     RowBox[{"\[CapitalDelta]\[Theta]", "=", 
      RowBox[{"\[Pi]", "/", 
       RowBox[{"(", 
        RowBox[{"5", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"2", "n"}], "+", "1"}], ")"}]}], ")"}]}]}], ";", 
     RowBox[{"\[Theta]sourcegrid", "=", 
      RowBox[{
       RowBox[{"2", "n"}], "+", "1"}]}], ";", 
     RowBox[{"l", "=", 
      RowBox[{
       RowBox[{"3", "n"}], "+", "1"}]}], ";", 
     RowBox[{"\[CapitalDelta]rstar", "=", 
      RowBox[{"d", "/", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"2", "l"}], "+", "1"}], ")"}]}]}], ";", "\n", 
     RowBox[{"rsourcegrid", "=", 
      RowBox[{
       RowBox[{"2", "l"}], "+", "1"}]}], ";", "\n", 
     RowBox[{"rplus", "=", 
      RowBox[{"M", "+", 
       RowBox[{"Sqrt", "[", 
        RowBox[{
         RowBox[{"M", "^", "2"}], "-", 
         RowBox[{"a", "^", "2"}]}], "]"}]}]}], ";", 
     RowBox[{"rminus", "=", 
      RowBox[{"M", "-", 
       RowBox[{"Sqrt", "[", 
        RowBox[{
         RowBox[{"M", "^", "2"}], "-", 
         RowBox[{"a", "^", "2"}]}], "]"}]}]}], ";", 
     RowBox[{
      RowBox[{"rtorstar", "[", "r_", "]"}], "=", 
      RowBox[{"r", "+", 
       RowBox[{
        RowBox[{
         RowBox[{"(", 
          RowBox[{"2", "M"}], " ", ")"}], "/", 
         RowBox[{"(", 
          RowBox[{"rplus", " ", "-", " ", "rminus"}], ")"}]}], " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"rplus", " ", 
           RowBox[{"Log", "[", 
            RowBox[{
             RowBox[{"(", 
              RowBox[{"r", "-", "rplus"}], ")"}], "/", 
             RowBox[{"(", 
              RowBox[{"2", "M"}], ")"}]}], "]"}]}], "-", 
          RowBox[{"rminus", " ", 
           RowBox[{"Log", "[", 
            RowBox[{
             RowBox[{"(", 
              RowBox[{"r", "-", "rminus"}], ")"}], "/", 
             RowBox[{"(", 
              RowBox[{"2", "M"}], ")"}]}], "]"}]}]}], ")"}]}]}]}], ";", "\n", 
     
     RowBox[{"r0star", "=", 
      RowBox[{"rtorstar", "[", "r0", "]"}]}], ";", "\n", 
     RowBox[{"rsmin", "=", 
      RowBox[{"r0star", "-", 
       RowBox[{"\[CapitalDelta]rstar", "/", "2"}], "-", 
       RowBox[{"l", "*", "\[CapitalDelta]rstar"}]}]}], ";", 
     RowBox[{"rsmax", "=", 
      RowBox[{"r0star", "+", 
       RowBox[{"\[CapitalDelta]rstar", "/", "2"}], "+", 
       RowBox[{"l", "*", "\[CapitalDelta]rstar"}]}]}], ";", "\n", 
     RowBox[{"\[Theta]smin", "=", 
      RowBox[{
       RowBox[{"\[Pi]", "/", "2"}], "-", 
       RowBox[{"\[CapitalDelta]\[Theta]", "/", "2"}], "-", 
       RowBox[{"n", "*", "\[CapitalDelta]\[Theta]"}]}]}], ";", 
     RowBox[{"\[Theta]smax", "=", 
      RowBox[{
       RowBox[{"\[Pi]", "/", "2"}], "+", 
       RowBox[{"\[CapitalDelta]\[Theta]", "/", "2"}], "+", 
       RowBox[{"n", "*", "\[CapitalDelta]\[Theta]"}]}]}], ";", "\n", 
     RowBox[{"rmatrixfactorminus", "=", 
      RowBox[{
       RowBox[{"Floor", "[", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"rsmin", "-", "rminapp"}], ")"}], "/", "d"}], "]"}], "+", 
       "1"}]}], ";", "\n", 
     RowBox[{"rmatrixfactorplus", "=", 
      RowBox[{
       RowBox[{"Floor", "[", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"rmaxapp", "-", "rsmax"}], ")"}], "/", "d"}], "]"}], "+", 
       "1"}]}], ";", "\n", 
     RowBox[{"rmin", "=", 
      RowBox[{"rsmin", "-", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"rmatrixfactorminus", "-", "1"}], ")"}], "*", "d"}]}]}], ";",
      "\n", 
     RowBox[{"rmax", "=", 
      RowBox[{
       RowBox[{
        RowBox[{"(", 
         RowBox[{"rmatrixfactorplus", "-", "1"}], ")"}], "*", "d"}], "+", 
       "rsmax"}]}], ";", "\n", "\n", 
     RowBox[{"imax", "=", 
      RowBox[{"Round", "[", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"rmax", "-", "rmin"}], ")"}], "/", "\[CapitalDelta]rstar"}], 
       "]"}]}], ";", 
     RowBox[{"jmax", "=", 
      RowBox[{"Floor", "[", 
       RowBox[{"\[Pi]", "/", "\[CapitalDelta]\[Theta]"}], "]"}]}], ";", "\n", 
     
     RowBox[{
      RowBox[{"guess", "[", "rstar_", "]"}], ":=", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"rstar", "<=", " ", 
         RowBox[{"-", "2"}]}], ",", 
        RowBox[{"rplus", "+", 
         RowBox[{"2", "*", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"1", "-", 
             RowBox[{"a", "^", "2"}]}], ")"}], "^", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"1", "/", "rplus"}], "-", 
             RowBox[{"1", "/", "2"}]}], ")"}]}], " ", 
          RowBox[{"Exp", "[", 
           RowBox[{
            RowBox[{"(", 
             RowBox[{
              RowBox[{"a", "^", "2"}], "-", "rplus", "+", 
              RowBox[{
               RowBox[{"(", 
                RowBox[{"rplus", "-", "1"}], ")"}], "*", "rstar"}]}], ")"}], 
            "/", "rplus"}], "]"}]}]}], ",", 
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{
           RowBox[{"-", "2"}], "<", "rstar", "<=", " ", "1000"}], ",", 
          RowBox[{"rplus", "+", 
           RowBox[{"2", 
            RowBox[{"(", 
             RowBox[{"ProductLog", "[", 
              RowBox[{"Exp", "[", 
               RowBox[{
                RowBox[{"1", "/", "2"}], " ", 
                RowBox[{"(", 
                 RowBox[{"rstar", "-", "rplus"}], ")"}]}], "]"}], "]"}], 
             ")"}]}]}], ",", 
          RowBox[{"rstar", "+", "rplus"}]}], "]"}]}], "]"}]}], ";", "\n", 
     RowBox[{
      RowBox[{"rstartor", "[", "rstar_", "]"}], ":=", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"rstar", "<", 
         RowBox[{"-", "50"}]}], ",", 
        RowBox[{"guess", "[", "rstar", "]"}], ",", 
        RowBox[{"r", "/.", 
         RowBox[{"FindRoot", "[", 
          RowBox[{
           RowBox[{
            RowBox[{
             RowBox[{"rtorstar", "[", "r", "]"}], "-", "rstar"}], "==", "0"}],
            ",", 
           RowBox[{"{", 
            RowBox[{"r", ",", 
             RowBox[{"guess", "[", "rstar", "]"}]}], "}"}], ",", 
           RowBox[{"Method", "->", "\"\<Newton\>\""}]}], "]"}]}]}], "]"}]}], 
     ";", "\n", 
     RowBox[{"listr1", "=", 
      RowBox[{
       RowBox[{
        RowBox[{"Table", "[", 
         RowBox[{
          RowBox[{"Re", "[", 
           RowBox[{"rstartor", "[", "rstar", "]"}], "]"}], ",", 
          RowBox[{"{", 
           RowBox[{
           "rstar", ",", "rmin", ",", "rmax", ",", "\[CapitalDelta]rstar"}], 
           "}"}]}], "]"}], "[", 
        RowBox[{"[", 
         RowBox[{"2", ";;", 
          RowBox[{"-", "2"}]}], "]"}], "]"}], "//", "Quiet"}]}], ";", "\n", 
     "\n", "\n", 
     RowBox[{"listrsource", "=", 
      RowBox[{
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{"Re", "[", 
          RowBox[{"rstartor", "[", "rstar", "]"}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{
          "rstar", ",", "rsmin", ",", "rsmax", ",", "\[CapitalDelta]rstar"}], 
          "}"}]}], "]"}], "//", "Quiet"}]}], ";", "\n", " ", 
     RowBox[{"listTheta", " ", "=", " ", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{"j", " ", "*", " ", "\[CapitalDelta]\[Theta]"}], ",", " ", 
        RowBox[{"{", 
         RowBox[{"j", ",", " ", "1", ",", " ", 
          RowBox[{"jmax", " ", "-", " ", "1"}]}], "}"}]}], "]"}]}], ";", "\n",
      "   ", "\n", 
     RowBox[{"diag", " ", "=", " ", 
      RowBox[{"Flatten", "[", 
       RowBox[{"ArrayPad", "[", 
        RowBox[{
         RowBox[{"Transpose", "[", 
          RowBox[{"Table", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"(", 
              RowBox[{
               RowBox[{
                RowBox[{"a", "^", "2"}], " ", 
                RowBox[{"m", "^", "2"}], " ", 
                RowBox[{"listr1", "^", "2"}], " ", 
                RowBox[{"(", 
                 RowBox[{
                  RowBox[{"a", "^", "2"}], " ", "+", " ", "\n", "      ", 
                  RowBox[{"listr1", " ", 
                   RowBox[{"(", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"-", "2"}], " ", "M"}], " ", "+", " ", "listr1"}],
                     ")"}]}]}], ")"}], " ", 
                RowBox[{"\[CapitalDelta]rstar", "^", "2"}], " ", 
                RowBox[{"\[CapitalDelta]\[Theta]", "^", "2"}], " ", 
                RowBox[{"\[CapitalOmega]", "^", "2"}]}], " ", "+", " ", 
               RowBox[{
                RowBox[{"(", 
                 RowBox[{
                  RowBox[{"2", " ", 
                   RowBox[{"listr1", "^", "2"}], " ", 
                   RowBox[{"(", 
                    RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "+", " ", 
                    RowBox[{"listr1", "\n", "       ", 
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"-", "2"}], " ", "M"}], " ", "+", " ", "listr1"}],
                     ")"}]}]}], ")"}], " ", 
                   RowBox[{"\[CapitalDelta]rstar", "^", "2"}]}], " ", "+", 
                  " ", 
                  RowBox[{"2", " ", 
                   RowBox[{"(", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"listr1", "^", "2"}], " ", 
                    RowBox[{
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "+", " ", 
                    RowBox[{"listr1", "^", "2"}]}], ")"}], "^", "2"}]}], " ", 
                    "-", " ", 
                    RowBox[{
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "-", " ", "\n", "      ", 
                    RowBox[{"I", " ", "a", " ", "m", " ", "listr1"}], " ", 
                    "-", " ", 
                    RowBox[{"M", " ", "listr1"}]}], ")"}], " ", 
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "+", " ", 
                    RowBox[{"listr1", " ", 
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"-", "2"}], " ", "M"}], " ", "+", " ", "listr1"}],
                     ")"}]}]}], ")"}], " ", 
                    RowBox[{"\[CapitalDelta]rstar", "^", "2"}]}]}], ")"}], 
                   " ", 
                   RowBox[{
                   "\[CapitalDelta]\[Theta]", "^", "\n", "      ", "2"}]}], 
                  " ", "+", " ", 
                  RowBox[{"4", " ", "a", " ", 
                   RowBox[{"m", "^", "2"}], " ", "M", " ", 
                   RowBox[{"listr1", "^", "3"}], " ", 
                   RowBox[{"\[CapitalDelta]rstar", "^", "2"}], " ", 
                   RowBox[{"\[CapitalDelta]\[Theta]", "^", "2"}], " ", 
                   "\[CapitalOmega]"}], " ", "-", " ", 
                  RowBox[{
                   RowBox[{"m", "^", "2"}], " ", 
                   RowBox[{"listr1", "^", "2"}], " ", 
                   RowBox[{
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "+", " ", 
                    RowBox[{"listr1", "^", "2"}]}], "\n", "      ", ")"}], 
                    "^", "2"}], " ", 
                   RowBox[{"\[CapitalDelta]rstar", "^", "2"}], " ", 
                   RowBox[{"\[CapitalDelta]\[Theta]", "^", "2"}], " ", 
                   RowBox[{"\[CapitalOmega]", "^", "2"}]}]}], ")"}], " ", 
                RowBox[{
                 RowBox[{"Csc", "[", "theta", "]"}], "^", "2"}]}], " ", "+", 
               " ", 
               RowBox[{
                RowBox[{"m", "^", "2"}], " ", 
                RowBox[{"listr1", "^", "2"}], " ", 
                RowBox[{"(", 
                 RowBox[{
                  RowBox[{"a", "^", "2"}], " ", "+", " ", 
                  RowBox[{"listr1", " ", 
                   RowBox[{"(", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"-", "2"}], " ", "\n", "      ", "M"}], " ", "+", 
                    " ", "listr1"}], ")"}]}]}], ")"}], " ", 
                RowBox[{"\[CapitalDelta]rstar", "^", "2"}], " ", 
                RowBox[{"\[CapitalDelta]\[Theta]", "^", "2"}], " ", 
                RowBox[{
                 RowBox[{"Csc", "[", "theta", "]"}], "^", "4"}]}]}], ")"}], 
             " ", "/", " ", 
             RowBox[{"(", 
              RowBox[{
               RowBox[{"listr1", "^", "2"}], " ", 
               RowBox[{"\[CapitalDelta]rstar", "^", "2"}], " ", 
               RowBox[{"\[CapitalDelta]\[Theta]", "^", "2"}], " ", 
               RowBox[{"(", 
                RowBox[{
                 RowBox[{
                  RowBox[{"-", "\n", "      ", 
                   RowBox[{"a", "^", "2"}]}], " ", 
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "+", " ", 
                    RowBox[{"listr1", " ", 
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"-", "2"}], " ", "M"}], " ", "+", " ", "listr1"}],
                     ")"}]}]}], ")"}]}], " ", "+", " ", 
                 RowBox[{
                  RowBox[{
                   RowBox[{"(", 
                    RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "+", " ", 
                    RowBox[{"listr1", "^", "2"}]}], ")"}], "^", "2"}], " ", 
                  RowBox[{
                   RowBox[{"Csc", "[", "theta", "]"}], "^", "2"}]}]}], 
                ")"}]}], "\n", "      ", ")"}]}], ",", " ", 
            RowBox[{"{", 
             RowBox[{"theta", ",", " ", "listTheta"}], "}"}]}], "]"}], "]"}], 
         ",", " ", "1"}], "]"}], "]"}]}], ";", "\n", "    ", 
     RowBox[{"rightDiag", " ", "=", " ", 
      RowBox[{"Flatten", "[", 
       RowBox[{"ArrayPad", "[", 
        RowBox[{
         RowBox[{"Transpose", "[", 
          RowBox[{"Table", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"(", 
              RowBox[{
               RowBox[{"a", "^", "2"}], " ", "+", " ", 
               RowBox[{"listr1", " ", 
                RowBox[{"(", 
                 RowBox[{
                  RowBox[{
                   RowBox[{"-", "2"}], " ", "M"}], " ", "\n", "      ", "+", 
                  " ", "listr1"}], ")"}]}]}], ")"}], " ", 
             RowBox[{
              RowBox[{"(", 
               RowBox[{"2", " ", "+", " ", 
                RowBox[{"\[CapitalDelta]\[Theta]", " ", 
                 RowBox[{"Cot", "[", "theta", "]"}]}]}], ")"}], " ", "/", " ", 
              RowBox[{"(", 
               RowBox[{"2", " ", 
                RowBox[{"\[CapitalDelta]\[Theta]", "^", "2"}], " ", 
                RowBox[{"(", 
                 RowBox[{
                  RowBox[{"-", 
                   RowBox[{
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "+", " ", 
                    RowBox[{"listr1", "^", "2"}]}], ")"}], "^", "2"}]}], " ", 
                  "+", " ", 
                  RowBox[{
                   RowBox[{"a", "^", "2"}], " ", 
                   RowBox[{"(", "\n", "      ", 
                    RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "+", " ", 
                    RowBox[{"listr1", " ", 
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"-", "2"}], " ", "M"}], " ", "+", " ", "listr1"}],
                     ")"}]}]}], ")"}], " ", 
                   RowBox[{
                    RowBox[{"Sin", "[", "theta", "]"}], "^", "2"}]}]}], 
                 ")"}]}], ")"}]}]}], ",", " ", 
            RowBox[{"{", 
             RowBox[{"theta", ",", " ", "listTheta"}], "}"}]}], "]"}], "]"}], 
         ",", " ", "1"}], "\n", "      ", "]"}], "]"}]}], ";", "\n", "    ", 
     RowBox[{"leftDiag", " ", "=", " ", 
      RowBox[{"Flatten", "[", 
       RowBox[{"ArrayPad", "[", 
        RowBox[{
         RowBox[{"Transpose", "[", 
          RowBox[{"Table", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"-", 
              RowBox[{"(", 
               RowBox[{
                RowBox[{"a", "^", "2"}], " ", "+", " ", 
                RowBox[{"listr1", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "2"}], " ", "M"}], " ", "\n", "      ", "+", 
                   " ", "listr1"}], ")"}]}]}], ")"}]}], " ", 
             RowBox[{
              RowBox[{"(", 
               RowBox[{
                RowBox[{"-", "2"}], " ", "+", " ", 
                RowBox[{"\[CapitalDelta]\[Theta]", " ", 
                 RowBox[{"Cot", "[", "theta", "]"}]}]}], ")"}], " ", "/", " ", 
              RowBox[{"(", 
               RowBox[{"2", " ", 
                RowBox[{"\[CapitalDelta]\[Theta]", "^", "2"}], " ", 
                RowBox[{"(", 
                 RowBox[{
                  RowBox[{"-", 
                   RowBox[{
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "+", " ", 
                    RowBox[{"listr1", "^", "2"}]}], ")"}], "^", "2"}]}], " ", 
                  "+", " ", 
                  RowBox[{
                   RowBox[{"a", "^", "2"}], " ", "\n", "      ", 
                   RowBox[{"(", 
                    RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "+", " ", 
                    RowBox[{"listr1", " ", 
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"-", "2"}], " ", "M"}], " ", "+", " ", "listr1"}],
                     ")"}]}]}], ")"}], " ", 
                   RowBox[{
                    RowBox[{"Sin", "[", "theta", "]"}], "^", "2"}]}]}], 
                 ")"}]}], ")"}]}]}], ",", " ", 
            RowBox[{"{", 
             RowBox[{"theta", ",", " ", "listTheta"}], "}"}]}], "]"}], "]"}], 
         ",", " ", "\n", "      ", "1"}], "]"}], "]"}]}], ";", "\n", "    ", 
     RowBox[{"rightSkipDiag", " ", "=", " ", 
      RowBox[{"Flatten", "[", 
       RowBox[{"ArrayPad", "[", 
        RowBox[{
         RowBox[{"Transpose", "[", 
          RowBox[{"Table", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"(", 
              RowBox[{
               RowBox[{
                RowBox[{"-", "listr1"}], " ", 
                RowBox[{
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"a", "^", "2"}], " ", "+", " ", "\n", "      ", 
                   RowBox[{"listr1", "^", "2"}]}], ")"}], "^", "2"}]}], " ", 
               "+", " ", 
               RowBox[{"a", " ", 
                RowBox[{"(", 
                 RowBox[{
                  RowBox[{"a", "^", "3"}], " ", "-", " ", 
                  RowBox[{"I", " ", 
                   RowBox[{"a", "^", "2"}], " ", "m", " ", "listr1"}], " ", 
                  "-", " ", 
                  RowBox[{"I", " ", "m", " ", 
                   RowBox[{"listr1", "^", "3"}]}], " ", "+", " ", 
                  RowBox[{"a", " ", "listr1", " ", 
                   RowBox[{"(", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"-", "2"}], " ", "M"}], "\n", "       ", "+", " ",
                     "listr1"}], ")"}]}]}], ")"}], " ", 
                "\[CapitalDelta]rstar"}]}], ")"}], " ", "/", " ", 
             RowBox[{"(", 
              RowBox[{"listr1", " ", 
               RowBox[{"\[CapitalDelta]rstar", "^", "2"}], " ", 
               RowBox[{"(", 
                RowBox[{
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "+", " ", 
                    RowBox[{"listr1", "^", "2"}]}], ")"}], "^", "2"}], " ", 
                 "-", " ", 
                 RowBox[{
                  RowBox[{"a", "^", "2"}], " ", 
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"a", "^", "2"}], "\n", "       ", "+", " ", 
                    RowBox[{"listr1", " ", 
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"-", "2"}], " ", "M"}], " ", "+", " ", "listr1"}],
                     ")"}]}]}], ")"}], " ", 
                  RowBox[{
                   RowBox[{"Sin", "[", "theta", "]"}], "^", "2"}]}]}], 
                ")"}]}], ")"}]}], ",", " ", 
            RowBox[{"{", 
             RowBox[{"theta", ",", " ", "listTheta"}], "}"}]}], "]"}], "]"}], 
         ",", " ", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"1", ",", "\n", "       ", "0"}], "}"}], ",", " ", 
           RowBox[{"{", 
            RowBox[{"1", ",", " ", "1"}], "}"}]}], "}"}]}], "]"}], "]"}]}], 
     ";", "\n", "    ", 
     RowBox[{"leftSkipDiag", " ", "=", " ", 
      RowBox[{"Flatten", "[", 
       RowBox[{"ArrayPad", "[", 
        RowBox[{
         RowBox[{"Transpose", "[", 
          RowBox[{"Table", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"-", 
              RowBox[{"(", 
               RowBox[{
                RowBox[{"listr1", " ", 
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "+", " ", 
                    RowBox[{"listr1", "\n", "      ", "^", "2"}]}], ")"}], 
                  "^", "2"}]}], " ", "+", " ", 
                RowBox[{"a", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"a", "^", "3"}], " ", "-", " ", 
                   RowBox[{"I", " ", 
                    RowBox[{"a", "^", "2"}], " ", "m", " ", "listr1"}], " ", 
                   "-", " ", 
                   RowBox[{"I", " ", "m", " ", 
                    RowBox[{"listr1", "^", "3"}]}], " ", "+", " ", 
                   RowBox[{"a", " ", "listr1", " ", 
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"-", "2"}], " ", "M"}], " ", "+", " ", "listr1"}],
                     "\n", "      ", ")"}]}]}], ")"}], " ", 
                 "\[CapitalDelta]rstar"}]}], ")"}]}], " ", "/", " ", 
             RowBox[{"(", 
              RowBox[{"listr1", " ", 
               RowBox[{"\[CapitalDelta]rstar", "^", "2"}], " ", 
               RowBox[{"(", 
                RowBox[{
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "+", " ", 
                    RowBox[{"listr1", "^", "2"}]}], ")"}], "^", "2"}], " ", 
                 "-", " ", 
                 RowBox[{
                  RowBox[{"a", "^", "2"}], " ", 
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"a", "^", "2"}], " ", "+", " ", 
                    RowBox[{"listr1", "\n", "       ", 
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"-", "2"}], " ", "M"}], " ", "+", " ", "listr1"}],
                     ")"}]}]}], ")"}], " ", 
                  RowBox[{
                   RowBox[{"Sin", "[", "theta", "]"}], "^", "2"}]}]}], 
                ")"}]}], ")"}]}], ",", " ", 
            RowBox[{"{", 
             RowBox[{"theta", ",", " ", "listTheta"}], "}"}]}], "]"}], "]"}], 
         ",", " ", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"0", ",", " ", "1"}], "}"}], ",", " ", 
           RowBox[{"{", 
            RowBox[{"1", ",", " ", "\n", "      ", "1"}], "}"}]}], "}"}]}], 
        "]"}], "]"}]}], ";", "\n", 
     RowBox[{"xBC1min", "=", 
      RowBox[{"3", "-", 
       RowBox[{"2", "I", " ", "\[CapitalDelta]rstar", " ", "\[Omega]"}]}]}], 
     ";", 
     RowBox[{"xBC2min", "=", 
      RowBox[{"-", "4"}]}], ";", 
     RowBox[{"xBC3min", "=", "1"}], ";", "\n", "\n", 
     RowBox[{"xBC1max", "=", 
      RowBox[{"5", "-", 
       RowBox[{"12", " ", "I", " ", "\[CapitalDelta]rstar", " ", "\[Omega]"}],
        "-", 
       RowBox[{"9", " ", 
        RowBox[{"\[CapitalDelta]rstar", "^", "2"}], " ", 
        RowBox[{"\[Omega]", "^", "2"}]}], "+", 
       RowBox[{"2", " ", "I", " ", 
        RowBox[{"\[CapitalDelta]rstar", "^", "3"}], " ", 
        RowBox[{"\[Omega]", "^", "3"}]}]}]}], ";", "\n", 
     RowBox[{"xBC2max", "=", 
      RowBox[{
       RowBox[{"-", "18"}], " ", "+", " ", 
       RowBox[{"30", " ", "I", " ", "\[CapitalDelta]rstar", " ", "\[Omega]"}],
        " ", "+", " ", 
       RowBox[{"12", " ", 
        RowBox[{"\[CapitalDelta]rstar", "^", "2"}], " ", 
        RowBox[{"\[Omega]", "^", "2"}]}]}]}], ";", "\n", 
     RowBox[{"xBC3max", "=", 
      RowBox[{"24", "-", 
       RowBox[{"24", " ", "I", " ", "\[CapitalDelta]rstar", " ", "\[Omega]"}],
        " ", "-", " ", 
       RowBox[{"3", " ", 
        RowBox[{"\[CapitalDelta]rstar", "^", "2"}], " ", 
        RowBox[{"\[Omega]", "^", "2"}]}]}]}], ";", "\n", 
     RowBox[{"xBC4max", "=", 
      RowBox[{
       RowBox[{"-", "14"}], "+", 
       RowBox[{
       "6", " ", "I", " ", "\[CapitalDelta]rstar", " ", "\[Omega]"}]}]}], ";",
      "\n", 
     RowBox[{"xBC5max", "=", "3"}], ";", "\n", 
     RowBox[{"yBC1", "=", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"m", "==", "0"}], ",", "3", ",", "1"}], "]"}]}], ";", 
     RowBox[{"yBC2", "=", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"m", "==", "0"}], ",", 
        RowBox[{"-", "4"}], ",", "0"}], "]"}]}], ";", 
     RowBox[{"yBC3", "=", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"m", "==", "0"}], ",", "1", ",", "0"}], "]"}]}], ";", "\n", 
     RowBox[{"MxBC", "=", 
      RowBox[{
       RowBox[{"SparseArray", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{
            RowBox[{"Band", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{"1", ",", " ", "1"}], "}"}], ",", " ", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{"(", 
                 RowBox[{"jmax", " ", "+", " ", "1"}], ")"}], ",", " ", 
                RowBox[{"(", 
                 RowBox[{"jmax", " ", "+", " ", "1"}], ")"}]}], "}"}]}], 
             "]"}], " ", "->", " ", "xBC1min"}], ",", "\n", 
           RowBox[{
            RowBox[{"Band", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{"1", ",", "  ", 
                RowBox[{"jmax", " ", "+", " ", "2"}]}], "}"}], ",", " ", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{"(", 
                 RowBox[{"jmax", " ", "+", " ", "1"}], ")"}], ",", " ", 
                RowBox[{"2", " ", 
                 RowBox[{"(", 
                  RowBox[{"1", "+", "jmax"}], ")"}]}]}], "}"}]}], "]"}], " ", 
            "->", " ", "xBC2min"}], ",", "\n", 
           RowBox[{
            RowBox[{"Band", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{"1", ",", 
                RowBox[{"3", "+", 
                 RowBox[{"2", " ", "jmax"}]}]}], "}"}], ",", " ", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{"(", 
                 RowBox[{"jmax", " ", "+", " ", "1"}], ")"}], ",", " ", 
                RowBox[{"3", " ", 
                 RowBox[{"(", 
                  RowBox[{"1", "+", "jmax"}], ")"}]}]}], "}"}]}], "]"}], " ", 
            "->", " ", "xBC3min"}], ",", "\n", 
           RowBox[{
            RowBox[{"Band", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{
                RowBox[{"1", "+", "imax", "+", 
                 RowBox[{"imax", " ", "jmax"}]}], ",", "  ", 
                RowBox[{
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{"imax", " ", "+", " ", "1"}], ")"}], " ", 
                  RowBox[{"(", 
                   RowBox[{"jmax", " ", "+", " ", "1"}], ")"}]}], "-", 
                 "jmax"}]}], "}"}], ",", " ", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{
                 RowBox[{"(", 
                  RowBox[{"imax", " ", "+", " ", "1"}], ")"}], " ", 
                 RowBox[{"(", 
                  RowBox[{"jmax", " ", "+", " ", "1"}], ")"}]}], ",", " ", 
                RowBox[{
                 RowBox[{"(", 
                  RowBox[{"imax", " ", "+", " ", "1"}], ")"}], " ", 
                 RowBox[{"(", 
                  RowBox[{"jmax", " ", "+", " ", "1"}], ")"}]}]}], "}"}]}], 
             "]"}], " ", "->", " ", "xBC1max"}], ",", "\n", 
           RowBox[{
            RowBox[{"Band", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{
                RowBox[{"1", "+", "imax", "+", 
                 RowBox[{"imax", " ", "jmax"}]}], ",", " ", 
                RowBox[{
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{"imax", " ", "+", " ", "1"}], ")"}], " ", 
                  RowBox[{"(", 
                   RowBox[{"jmax", " ", "+", " ", "1"}], ")"}]}], "-", "jmax",
                  "-", "1", "-", "jmax"}]}], "}"}], ",", " ", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{
                 RowBox[{"(", 
                  RowBox[{"imax", " ", "+", " ", "1"}], ")"}], " ", 
                 RowBox[{"(", 
                  RowBox[{"jmax", " ", "+", " ", "1"}], ")"}]}], ",", " ", 
                RowBox[{
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{"imax", " ", "+", " ", "1"}], ")"}], " ", 
                  RowBox[{"(", 
                   RowBox[{"jmax", " ", "+", " ", "1"}], ")"}]}], "-", "jmax",
                  "-", "1"}]}], "}"}]}], "]"}], " ", "->", " ", "xBC2max"}], 
           ",", "\n", 
           RowBox[{
            RowBox[{"Band", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{
                RowBox[{"1", "+", "imax", "+", 
                 RowBox[{"imax", " ", "jmax"}]}], ",", 
                RowBox[{
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{"imax", " ", "+", " ", "1"}], ")"}], " ", 
                  RowBox[{"(", 
                   RowBox[{"jmax", " ", "+", " ", "1"}], ")"}]}], "-", "jmax",
                  "-", "1", "-", "jmax", "-", "1", "-", "jmax"}]}], "}"}], 
              ",", " ", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{
                 RowBox[{"(", 
                  RowBox[{"imax", " ", "+", " ", "1"}], ")"}], " ", 
                 RowBox[{"(", 
                  RowBox[{"jmax", " ", "+", " ", "1"}], ")"}]}], ",", 
                RowBox[{
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{"imax", " ", "+", " ", "1"}], ")"}], " ", 
                  RowBox[{"(", 
                   RowBox[{"jmax", " ", "+", " ", "1"}], ")"}]}], "-", "jmax",
                  "-", "1", "-", "jmax", "-", "1"}]}], "}"}]}], "]"}], " ", "->",
             " ", "xBC3max"}], ",", "\n", 
           RowBox[{
            RowBox[{"Band", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{
                RowBox[{"1", "+", "imax", "+", 
                 RowBox[{"imax", " ", "jmax"}]}], ",", 
                RowBox[{
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{"imax", " ", "+", " ", "1"}], ")"}], " ", 
                  RowBox[{"(", 
                   RowBox[{"jmax", " ", "+", " ", "1"}], ")"}]}], "-", "jmax",
                  "-", "1", "-", "jmax", "-", "1", "-", "jmax", "-", "1", "-",
                  "jmax"}]}], "}"}], ",", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{
                 RowBox[{"(", 
                  RowBox[{"imax", " ", "+", " ", "1"}], ")"}], " ", 
                 RowBox[{"(", 
                  RowBox[{"jmax", " ", "+", " ", "1"}], ")"}]}], ",", 
                RowBox[{
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{"imax", " ", "+", " ", "1"}], ")"}], " ", 
                  RowBox[{"(", 
                   RowBox[{"jmax", " ", "+", " ", "1"}], ")"}]}], "-", "jmax",
                  "-", "1", "-", "jmax", "-", "1", "-", "jmax", "-", "1"}]}], 
               "}"}]}], "]"}], " ", "->", "xBC4max"}], ",", "\n", 
           RowBox[{
            RowBox[{"Band", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{
                RowBox[{"1", "+", "imax", "+", 
                 RowBox[{"imax", " ", "jmax"}]}], ",", 
                RowBox[{
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{"imax", " ", "+", " ", "1"}], ")"}], " ", 
                  RowBox[{"(", 
                   RowBox[{"jmax", " ", "+", " ", "1"}], ")"}]}], "-", "jmax",
                  "-", "1", "-", "jmax", "-", "1", "-", "jmax", "-", "1", "-",
                  "jmax", "-", "1", "-", "jmax"}]}], "}"}], ",", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{
                 RowBox[{"(", 
                  RowBox[{"imax", " ", "+", " ", "1"}], ")"}], " ", 
                 RowBox[{"(", 
                  RowBox[{"jmax", " ", "+", " ", "1"}], ")"}]}], ",", 
                RowBox[{
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{"imax", " ", "+", " ", "1"}], ")"}], " ", 
                  RowBox[{"(", 
                   RowBox[{"jmax", " ", "+", " ", "1"}], ")"}]}], "-", "jmax",
                  "-", "1", "-", "jmax", "-", "1", "-", "jmax", "-", "1", "-",
                  "jmax", "-", "1"}]}], "}"}]}], "]"}], " ", "->", 
            "xBC5max"}], ",", "\n", 
           RowBox[{
            RowBox[{"Band", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{
                RowBox[{"2", "+", "jmax"}], ",", 
                RowBox[{"2", "+", "jmax"}]}], "}"}], ",", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{"imax", "+", 
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"-", "1"}], "+", "imax"}], ")"}], " ", "jmax"}]}],
                 ",", 
                RowBox[{"imax", "+", 
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"-", "1"}], "+", "imax"}], ")"}], " ", 
                  "jmax"}]}]}], "}"}], ",", 
              RowBox[{"1", "+", "jmax"}]}], "]"}], "->", "yBC1"}], ",", 
           RowBox[{
            RowBox[{"Band", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{
                RowBox[{"2", 
                 RowBox[{"(", 
                  RowBox[{"1", "+", "jmax"}], ")"}]}], ",", 
                RowBox[{"2", 
                 RowBox[{"(", 
                  RowBox[{"1", "+", "jmax"}], ")"}]}]}], "}"}], ",", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{
                 RowBox[{"(", 
                  RowBox[{"1", "+", "imax", "-", "1"}], ")"}], 
                 RowBox[{"(", 
                  RowBox[{"1", "+", "jmax"}], ")"}]}], ",", 
                RowBox[{
                 RowBox[{"(", 
                  RowBox[{"1", "+", "imax", "-", "1"}], ")"}], 
                 RowBox[{"(", 
                  RowBox[{"1", "+", "jmax"}], ")"}]}]}], "}"}], ",", 
              RowBox[{"1", "+", "jmax"}]}], "]"}], "->", "yBC1"}], ",", 
           RowBox[{
            RowBox[{"Band", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{
                RowBox[{"2", "+", "jmax"}], ",", 
                RowBox[{"3", "+", "jmax"}]}], "}"}], ",", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{"imax", "+", 
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"-", "1"}], "+", "imax"}], ")"}], " ", "jmax"}]}],
                 ",", 
                RowBox[{"imax", "+", 
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"-", "1"}], "+", "imax"}], ")"}], " ", "jmax"}], 
                 "+", "1"}]}], "}"}], ",", 
              RowBox[{"1", "+", "jmax"}]}], "]"}], "->", "yBC2"}], ",", 
           RowBox[{
            RowBox[{"Band", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{
                RowBox[{"2", 
                 RowBox[{"(", 
                  RowBox[{"1", "+", "jmax"}], ")"}]}], ",", 
                RowBox[{
                 RowBox[{"2", 
                  RowBox[{"(", 
                   RowBox[{"1", "+", "jmax"}], ")"}]}], "-", "1"}]}], "}"}], 
              ",", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{
                 RowBox[{"(", 
                  RowBox[{"1", "+", "imax", "-", "1"}], ")"}], 
                 RowBox[{"(", 
                  RowBox[{"1", "+", "jmax"}], ")"}]}], ",", 
                RowBox[{
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{"1", "+", "imax", "-", "1"}], ")"}], 
                  RowBox[{"(", 
                   RowBox[{"1", "+", "jmax"}], ")"}]}], "-", "1"}]}], "}"}], 
              ",", 
              RowBox[{"1", "+", "jmax"}]}], "]"}], "->", "yBC2"}], ",", 
           RowBox[{
            RowBox[{"Band", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{
                RowBox[{"2", "+", "jmax"}], ",", 
                RowBox[{"4", "+", "jmax"}]}], "}"}], ",", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{"imax", "+", 
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"-", "1"}], "+", "imax"}], ")"}], " ", "jmax"}]}],
                 ",", 
                RowBox[{"imax", "+", 
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"-", "1"}], "+", "imax"}], ")"}], " ", "jmax"}], 
                 "+", "2"}]}], "}"}], ",", 
              RowBox[{"1", "+", "jmax"}]}], "]"}], "->", "yBC3"}], ",", 
           RowBox[{
            RowBox[{"Band", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{
                RowBox[{"2", 
                 RowBox[{"(", 
                  RowBox[{"1", "+", "jmax"}], ")"}]}], ",", 
                RowBox[{
                 RowBox[{"2", 
                  RowBox[{"(", 
                   RowBox[{"1", "+", "jmax"}], ")"}]}], "-", "2"}]}], "}"}], 
              ",", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{
                 RowBox[{"(", 
                  RowBox[{"1", "+", "imax", "-", "1"}], ")"}], 
                 RowBox[{"(", 
                  RowBox[{"1", "+", "jmax"}], ")"}]}], ",", 
                RowBox[{
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{"1", "+", "imax", "-", "1"}], ")"}], 
                  RowBox[{"(", 
                   RowBox[{"1", "+", "jmax"}], ")"}]}], "-", "2"}]}], "}"}], 
              ",", 
              RowBox[{"1", "+", "jmax"}]}], "]"}], "->", "yBC3"}]}], "}"}], 
         ",", " ", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{
            RowBox[{"(", 
             RowBox[{"imax", " ", "+", " ", "1"}], ")"}], " ", 
            RowBox[{"(", 
             RowBox[{"jmax", " ", "+", " ", "1"}], ")"}]}], ",", " ", 
           RowBox[{
            RowBox[{"(", 
             RowBox[{"imax", " ", "+", " ", "1"}], ")"}], " ", 
            RowBox[{"(", 
             RowBox[{"jmax", " ", "+", " ", "1"}], ")"}]}]}], "}"}], ",", " ",
          "0"}], "]"}], " ", "+", " ", 
       RowBox[{"DiagonalMatrix", "[", 
        RowBox[{
         RowBox[{"SparseArray", "[", "\n", "      ", 
          RowBox[{
           RowBox[{
            RowBox[{"{", "i_", "}"}], " ", ":>", " ", 
            RowBox[{"diag", "[", 
             RowBox[{"[", "i", "]"}], "]"}]}], ",", " ", 
           RowBox[{"{", 
            RowBox[{"Length", "[", "diag", "]"}], "}"}], ",", " ", "0"}], 
          "]"}], ",", " ", "0"}], "]"}], " ", "+", " ", 
       RowBox[{"DiagonalMatrix", "[", 
        RowBox[{
         RowBox[{"SparseArray", "[", "\n", "      ", 
          RowBox[{
           RowBox[{
            RowBox[{"{", "i_", "}"}], " ", ":>", " ", 
            RowBox[{"rightDiag", "[", 
             RowBox[{"[", "i", "]"}], "]"}]}], ",", " ", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"Length", "[", "rightDiag", "]"}], " ", "-", " ", "1"}], 
            "}"}], ",", " ", "0"}], "]"}], ",", " ", "1"}], "]"}], "+", " ", 
       RowBox[{"DiagonalMatrix", "[", "\n", "      ", 
        RowBox[{
         RowBox[{"SparseArray", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"{", "i_", "}"}], " ", ":>", " ", 
            RowBox[{"leftDiag", "[", 
             RowBox[{"[", 
              RowBox[{"i", " ", "+", " ", "1"}], "]"}], "]"}]}], ",", " ", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"Length", "[", "leftDiag", "]"}], " ", "-", " ", "1"}], 
            "}"}], ",", " ", "0"}], "]"}], ",", " ", 
         RowBox[{"-", "1"}]}], "\n", "      ", "]"}], " ", "+", " ", 
       RowBox[{"DiagonalMatrix", "[", 
        RowBox[{
         RowBox[{"SparseArray", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"{", "i_", "}"}], " ", ":>", " ", 
            RowBox[{"rightSkipDiag", "[", 
             RowBox[{"[", "i", "]"}], "]"}]}], ",", " ", 
           RowBox[{"{", 
            RowBox[{"Length", "[", "rightSkipDiag", "\n", "      ", "]"}], 
            "}"}], ",", " ", "0"}], "]"}], ",", " ", 
         RowBox[{"jmax", " ", "+", " ", "1"}]}], "]"}], " ", "+", " ", 
       RowBox[{"DiagonalMatrix", "[", 
        RowBox[{
         RowBox[{"SparseArray", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"{", "i_", "}"}], " ", ":>", " ", 
            RowBox[{"leftSkipDiag", "[", 
             RowBox[{"[", "\n", "      ", "i", "]"}], "]"}]}], ",", " ", 
           RowBox[{"{", 
            RowBox[{"Length", "[", "leftSkipDiag", "]"}], "}"}], ",", " ", 
           "0"}], "]"}], ",", " ", 
         RowBox[{
          RowBox[{"-", "jmax"}], " ", "-", " ", "1"}]}], "]"}]}]}], ";", "\n",
      "MxBC"}]}], "]"}]}], "\n", 
 RowBox[{"      "}]}], "Input",
 CellChangeTimes->{{3.841948422624687*^9, 3.841948430561668*^9}, {
   3.841950813790756*^9, 3.841950814437524*^9}, {3.841969836648246*^9, 
   3.841969839197991*^9}, {3.841977428180457*^9, 3.841977431555067*^9}, {
   3.841978485787064*^9, 3.841978489553925*^9}, {3.842034117919841*^9, 
   3.842034134740554*^9}, {3.8420341719423923`*^9, 3.842034198146079*^9}, {
   3.842034246318987*^9, 3.8420342530589113`*^9}, {3.842034338437084*^9, 
   3.8420343520824003`*^9}, {3.8420356862362833`*^9, 3.842035754714065*^9}, {
   3.84203588406951*^9, 3.84203592273313*^9}, {3.842036045114616*^9, 
   3.842036054747489*^9}, {3.842042906250284*^9, 3.842042907881855*^9}, 
   3.8420560358025837`*^9},ExpressionUUID->"43ac210c-3c52-464f-956a-\
020439a230f7"]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[StyleBox["Linear Solve ",
 FontSize->14]], "Section",
 CellChangeTimes->{{3.841951143843871*^9, 3.841951164042519*^9}, {
  3.842056522068201*^9, 
  3.842056530626068*^9}},ExpressionUUID->"6a8a1fa7-1ff7-4585-9a0b-\
e7d392fb85cd"],

Cell[TextData[{
 "Here, I\[CloseCurlyQuote]m solving the linear system, ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["M", "coupling"], TraditionalForm]],
  FormatType->TraditionalForm,ExpressionUUID->
  "98172ee1-bbed-47b8-aacc-d47823c988f9"],
 " * ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["M", 
    SuperscriptBox["\[CapitalPsi]", "m"]], TraditionalForm]],
  FormatType->TraditionalForm,ExpressionUUID->
  "d1405593-a8a8-4968-910a-2dc345ba667c"],
 " = ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["M", 
    SuperscriptBox["source", "m"]], TraditionalForm]],
  FormatType->TraditionalForm,ExpressionUUID->
  "8eefad23-9fc6-46b0-8f16-c65c73a84184"]
}], "Text",
 CellChangeTimes->{{3.8420565629201803`*^9, 
  3.842056591346869*^9}},ExpressionUUID->"7952f6b6-558d-481f-91c7-\
d1e954f6502e"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"\[Psi]FDA", "[", 
    RowBox[{
    "n_", ",", " ", "m_", ",", " ", "a_", ",", " ", "r0_", ",", " ", 
     "rminapp_", ",", " ", "rmaxapp_", ",", " ", "d_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"final\[Psi]1", ",", "jmax", ",", "\[CapitalDelta]\[Theta]"}], 
      "}"}], ",", 
     RowBox[{
      RowBox[{"\[CapitalDelta]\[Theta]", "=", 
       FractionBox["\[Pi]", 
        RowBox[{"5", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"2", "n"}], "+", "1"}], ")"}]}]]}], ";", 
      RowBox[{"jmax", "=", 
       RowBox[{"Floor", "[", 
        RowBox[{
         FractionBox["\[Pi]", "\[CapitalDelta]\[Theta]"], "+", "1"}], "]"}]}],
       ";", "\[IndentingNewLine]", "\[IndentingNewLine]", 
      RowBox[{"final\[Psi]1", ":=", 
       RowBox[{"Partition", "[", 
        RowBox[{
         RowBox[{"LinearSolve", "[", 
          RowBox[{
           RowBox[{"CouplingMatrix", "[", 
            RowBox[{
            "n", ",", "m", ",", "a", ",", "r0", ",", "rminapp", ",", 
             "rmaxapp", ",", "d"}], "]"}], ",", 
           RowBox[{"SourceMatrix", "[", 
            RowBox[{
            "n", ",", "m", ",", "a", ",", "r0", ",", "rminapp", ",", 
             "rmaxapp", ",", "d"}], "]"}], ",", 
           RowBox[{"Method", "\[Rule]", "\"\<Pardiso\>\""}]}], "]"}], ",", 
         "jmax"}], "]"}]}], ";", "\[IndentingNewLine]", "final\[Psi]1"}]}], 
    "]"}]}], ";"}]], "Input",
 CellChangeTimes->{{3.841868499996069*^9, 3.841868500356613*^9}, {
   3.841868579442869*^9, 3.8418686245299788`*^9}, {3.841878258272697*^9, 
   3.841878258903634*^9}, {3.841880489343442*^9, 3.841880490270762*^9}, {
   3.842036022023944*^9, 3.84203603034947*^9}, 3.8420556519006033`*^9, 
   3.842056038055599*^9, 
   3.842056628206471*^9},ExpressionUUID->"daf6ed27-85f7-4e57-82f7-\
7b8327b778a7"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"\[Psi]sol", "=", 
  RowBox[{"\[Psi]FDA", "[", 
   RowBox[{
   "n", ",", "m", ",", "a", ",", "r0", ",", "rminapp", ",", "rmaxapp", ",", 
    "d"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.8418782800229883`*^9, 3.8418782984370317`*^9}, {
   3.8419493294343033`*^9, 3.8419493312634478`*^9}, {3.841950877749885*^9, 
   3.841950878247712*^9}, 3.842056631525194*^9, {3.842056668932055*^9, 
   3.84205668743874*^9}},ExpressionUUID->"53622069-b824-4e52-97dd-\
8c6c7627ce96"],

Cell[BoxData[
 InterpretationBox[
  TagBox[
   FrameBox[GridBox[{
      {
       ItemBox[
        TagBox[
         RowBox[{"{", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"0.`", "\[VeryThinSpace]", "+", 
              RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], ",", 
             RowBox[{"7.595154433411103`*^-8", "+", 
              RowBox[{"9.316474630555174`*^-8", " ", "\[ImaginaryI]"}]}], ",", 
             RowBox[{"3.037714611421822`*^-7", "+", 
              RowBox[{"3.726159361658546`*^-7", " ", "\[ImaginaryI]"}]}], ",", 
             RowBox[{"6.833139604870313`*^-7", "+", 
              RowBox[{"8.381727870728785`*^-7", " ", "\[ImaginaryI]"}]}], ",", 
             RowBox[{"1.2143242481248552`*^-6", "+", 
              RowBox[{"1.4895193546889313`*^-6", " ", "\[ImaginaryI]"}]}], 
             ",", 
             TemplateBox[{"226"},
              "OutputSizeLimit`Skeleton"], ",", 
             RowBox[{"1.2143242481254827`*^-6", "+", 
              RowBox[{"1.4895193546891676`*^-6", " ", "\[ImaginaryI]"}]}], 
             ",", 
             RowBox[{"6.833139604872594`*^-7", "+", 
              RowBox[{"8.381727870730596`*^-7", " ", "\[ImaginaryI]"}]}], ",", 
             RowBox[{"3.0377146114228214`*^-7", "+", 
              RowBox[{"3.7261593616592405`*^-7", " ", "\[ImaginaryI]"}]}], 
             ",", 
             RowBox[{"7.595154433413875`*^-8", "+", 
              RowBox[{"9.316474630556727`*^-8", " ", "\[ImaginaryI]"}]}], ",", 
             RowBox[{"0.`", "\[VeryThinSpace]", "+", 
              RowBox[{"0.`", " ", "\[ImaginaryI]"}]}]}], "}"}], ",", 
           TemplateBox[{"10433"},
            "OutputSizeLimit`Skeleton"], ",", 
           RowBox[{"{", 
            TemplateBox[{"1"},
             "OutputSizeLimit`Skeleton"], "}"}]}], "}"}],
         Short[#, 5]& ],
        BaseStyle->{Deployed -> False},
        StripOnInput->False]},
      {GridBox[{
         {
          TagBox[
           TooltipBox[
            StyleBox[
             StyleBox[
              DynamicBox[ToBoxes[
                FEPrivate`FrontEndResource[
                "FEStrings", "sizeBriefExplanation"], StandardForm],
               ImageSizeCache->{59., {2., 8.}}],
              StripOnInput->False,
              DynamicUpdating->True], "OSLText",
             StripOnInput->False],
            StyleBox[
             DynamicBox[
              ToBoxes[
               FEPrivate`FrontEndResource["FEStrings", "sizeExplanation"], 
               StandardForm]], DynamicUpdating -> True, StripOnInput -> 
             False]],
           Annotation[#, 
            Style[
             Dynamic[
              FEPrivate`FrontEndResource["FEStrings", "sizeExplanation"]], 
             DynamicUpdating -> True], "Tooltip"]& ], 
          ButtonBox[
           PaneSelectorBox[{False->
            StyleBox[
             StyleBox[
              DynamicBox[ToBoxes[
                FEPrivate`FrontEndResource["FEStrings", "sizeShowLess"], 
                StandardForm],
               ImageSizeCache->{51., {0., 8.}}],
              StripOnInput->False,
              DynamicUpdating->True], "OSLControl",
             StripOnInput->False], True->
            StyleBox[
             StyleBox[
              DynamicBox[ToBoxes[
                FEPrivate`FrontEndResource["FEStrings", "sizeShowLess"], 
                StandardForm]],
              StripOnInput->False,
              DynamicUpdating->True], "OSLControlActive",
             StripOnInput->False]}, Dynamic[
             CurrentValue["MouseOver"]],
            Alignment->Center,
            FrameMargins->0,
            ImageSize->{Automatic, 25}],
           Appearance->None,
           BaselinePosition->Baseline,
           
           ButtonFunction:>OutputSizeLimit`ButtonFunction[
            OutputSizeLimit`Defer, 148, 32674000390013037947, 5/2],
           Enabled->True,
           Evaluator->Automatic,
           Method->"Queued"], 
          ButtonBox[
           PaneSelectorBox[{False->
            StyleBox[
             StyleBox[
              DynamicBox[ToBoxes[
                FEPrivate`FrontEndResource["FEStrings", "sizeShowMore"], 
                StandardForm],
               ImageSizeCache->{56., {0., 8.}}],
              StripOnInput->False,
              DynamicUpdating->True], "OSLControl",
             StripOnInput->False], True->
            StyleBox[
             StyleBox[
              DynamicBox[ToBoxes[
                FEPrivate`FrontEndResource["FEStrings", "sizeShowMore"], 
                StandardForm]],
              StripOnInput->False,
              DynamicUpdating->True], "OSLControlActive",
             StripOnInput->False]}, Dynamic[
             CurrentValue["MouseOver"]],
            Alignment->Center,
            FrameMargins->0,
            ImageSize->{Automatic, 25}],
           Appearance->None,
           BaselinePosition->Baseline,
           
           ButtonFunction:>OutputSizeLimit`ButtonFunction[
            OutputSizeLimit`Defer, 148, 32674000390013037947, 5 2],
           Enabled->True,
           Evaluator->Automatic,
           Method->"Queued"], 
          ButtonBox[
           PaneSelectorBox[{False->
            StyleBox[
             StyleBox[
              DynamicBox[ToBoxes[
                FEPrivate`FrontEndResource["FEStrings", "sizeShowAll"], 
                StandardForm],
               ImageSizeCache->{42., {0., 8.}}],
              StripOnInput->False,
              DynamicUpdating->True], "OSLControl",
             StripOnInput->False], True->
            StyleBox[
             StyleBox[
              DynamicBox[ToBoxes[
                FEPrivate`FrontEndResource["FEStrings", "sizeShowAll"], 
                StandardForm],
               ImageSizeCache->{42., {0., 8.}}],
              StripOnInput->False,
              DynamicUpdating->True], "OSLControlActive",
             StripOnInput->False]}, Dynamic[
             CurrentValue["MouseOver"]],
            Alignment->Center,
            FrameMargins->0,
            ImageSize->{Automatic, 25}],
           Appearance->None,
           BaselinePosition->Baseline,
           
           ButtonFunction:>OutputSizeLimit`ButtonFunction[
            OutputSizeLimit`Defer, 148, 32674000390013037947, Infinity],
           Enabled->True,
           Evaluator->Automatic,
           Method->"Queued"], 
          ButtonBox[
           PaneSelectorBox[{False->
            StyleBox[
             StyleBox[
              DynamicBox[ToBoxes[
                FEPrivate`FrontEndResource["FEStrings", "sizeChangeLimit"], 
                StandardForm],
               ImageSizeCache->{77., {0., 8.}}],
              StripOnInput->False,
              DynamicUpdating->True], "OSLControl",
             StripOnInput->False], True->
            StyleBox[
             StyleBox[
              DynamicBox[ToBoxes[
                FEPrivate`FrontEndResource["FEStrings", "sizeChangeLimit"], 
                StandardForm]],
              StripOnInput->False,
              DynamicUpdating->True], "OSLControlActive",
             StripOnInput->False]}, Dynamic[
             CurrentValue["MouseOver"]],
            Alignment->Center,
            FrameMargins->0,
            ImageSize->{Automatic, 25}],
           Appearance->None,
           BaselinePosition->Baseline,
           ButtonFunction:>FrontEndExecute[{
              FrontEnd`SetOptions[
              FrontEnd`$FrontEnd, 
               FrontEnd`PreferencesSettings -> {"Page" -> "Advanced"}], 
              FrontEnd`FrontEndToken["PreferencesDialog"]}],
           Evaluator->None,
           Method->"Preemptive"]}
        },
        AutoDelete->False,
        FrameStyle->GrayLevel[0.85],
        GridBoxDividers->{"Columns" -> {False, {True}}},
        GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}},
        GridBoxSpacings->{"Columns" -> {{2}}}]}
     },
     DefaultBaseStyle->"Column",
     GridBoxAlignment->{
      "Columns" -> {{Left}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
       "RowsIndexed" -> {}},
     GridBoxDividers->{
      "Columns" -> {{False}}, "ColumnsIndexed" -> {}, "Rows" -> {{False}}, 
       "RowsIndexed" -> {}},
     GridBoxItemSize->{
      "Columns" -> {{Automatic}}, "ColumnsIndexed" -> {}, "Rows" -> {{1.}}, 
       "RowsIndexed" -> {}},
     GridBoxSpacings->{"Columns" -> {
         Offset[0.27999999999999997`], {
          Offset[0.5599999999999999]}, 
         Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
         Offset[0.2], 
         Offset[1.2], {
          Offset[0.4]}, 
         Offset[0.2]}, "RowsIndexed" -> {}}],
    BaseStyle->"OutputSizeLimit",
    FrameMargins->{{12, 12}, {0, 15}},
    FrameStyle->GrayLevel[0.85],
    RoundingRadius->5,
    StripOnInput->False],
   Deploy,
   DefaultBaseStyle->"Deploy"],
  If[32674000390013037947 === $SessionID, 
   Out[148], Message[
     MessageName[Syntax, "noinfoker"]]; Missing["NotAvailable"]; 
   Null]]], "Output",
 CellChangeTimes->{3.841978933206628*^9, 3.841979360124671*^9, 
  3.841979742856649*^9, 3.841980291502593*^9, 3.8419813419130783`*^9, 
  3.841982230481884*^9, 3.841983370041265*^9, 3.8419852982230597`*^9, 
  3.841987539460464*^9, 3.841989445401422*^9, 3.841993868449101*^9, 
  3.842004170991294*^9, 3.842039155619584*^9, 3.842042957160728*^9, 
  3.842043310531192*^9, 3.842043590785964*^9, 3.842043739026761*^9, 
  3.8420440654481487`*^9, 3.842044312400057*^9, 3.842044626733306*^9, 
  3.8420448675910273`*^9, 3.842045187843172*^9, 3.8420456372311697`*^9, 
  3.842046966337953*^9, 3.842047566743638*^9, 3.842048258631967*^9, 
  3.842049900889883*^9},
 CellLabel->
  "Out[148]=",ExpressionUUID->"aed58c13-6692-4302-af8c-00360f681869"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[StyleBox["Reassigning i-j grids to r-\[Theta] grids ",
 FontSize->14]], "Section",
 CellChangeTimes->{{3.841951167753521*^9, 3.841951177655843*^9}, {
  3.8420566986854563`*^9, 
  3.842056726539157*^9}},ExpressionUUID->"f19d74db-9633-4dfc-bba9-\
039d192cb38f"],

Cell[TextData[{
 "Here, I\[CloseCurlyQuote]m re-assigning \[Psi][i, j] to ",
 Cell[BoxData[
  FormBox[
   RowBox[{"\[Psi]", "[", 
    RowBox[{
     SuperscriptBox["r", "*"], ","}]}], TraditionalForm]],
  FormatType->TraditionalForm,ExpressionUUID->
  "85272a45-d609-49ac-bc24-2fface3947c4"],
 "\[Theta]] \nThe solution includes ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["i", "max"], TraditionalForm]],
  FormatType->TraditionalForm,ExpressionUUID->
  "53b74bd6-a288-4310-b8a7-2a0a7004a12b"],
 ", ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["j", "max"], TraditionalForm]],
  FormatType->TraditionalForm,ExpressionUUID->
  "9f652f4b-24ac-4a4a-823e-59fae40be265"],
 ", ",
 Cell[BoxData[
  FormBox[
   SuperscriptBox["\[CapitalDelta]r", "*"], TraditionalForm]],
  FormatType->TraditionalForm,ExpressionUUID->
  "98b1b147-fb04-480b-a7fe-77d2f3cd01b6"],
 ", \[CapitalDelta]\[Theta], which will be used later. "
}], "Text",
 CellChangeTimes->{{3.842057094265395*^9, 
  3.8420571663956823`*^9}},ExpressionUUID->"48901350-78e5-4879-8c96-\
879a3aecdb6f"],

Cell[BoxData[
 RowBox[{
  RowBox[{"\[Psi]atr\[Theta]", "[", 
   RowBox[{
   "n_", ",", " ", "m_", ",", " ", "a_", ",", " ", "r0_", ",", " ", 
    "rminapp_", ",", " ", "rmaxapp_", ",", " ", "d_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
     "imax", ",", "rstarmax", ",", "rstarmin", ",", "r0star", ",", "jmax", 
      ",", "rplus", ",", "rminus", ",", "rtorstar", ",", "listr", ",", 
      "rstartor", ",", "listrstar", ",", "list\[Theta]", ",", "guess", ",", 
      "function\[CapitalPsi]", ",", "d\[CapitalPsi]r", ",", "\[CurlyPhi]", 
      ",", "\[CapitalDelta]", ",", "\[Psi]inr\[Theta]1try1", ",", 
      "\[CapitalDelta]rstar", ",", "\[CapitalDelta]\[Theta]", ",", 
      "rmatrixfactorminus", ",", "rmatrixfactorplus", ",", "rmin", ",", 
      "rsmin", ",", "rsmax", ",", "rmax", ",", "l"}], "}"}], ",", 
    RowBox[{
     RowBox[{"\[CapitalDelta]\[Theta]", "=", 
      FractionBox["\[Pi]", 
       RowBox[{"5", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"2", "n"}], "+", "1"}], ")"}]}]]}], ";", 
     RowBox[{"l", "=", 
      RowBox[{
       RowBox[{"3", "n"}], "+", "1"}]}], ";", 
     RowBox[{"\[CapitalDelta]rstar", "=", 
      FractionBox["d", 
       RowBox[{
        RowBox[{"2", "l"}], "+", "1"}]]}], ";", "\[IndentingNewLine]", 
     RowBox[{"rplus", "=", 
      RowBox[{"M", "+", 
       SqrtBox[
        RowBox[{
         SuperscriptBox["M", "2"], "-", 
         SuperscriptBox["a", "2"]}]]}]}], ";", 
     RowBox[{"rminus", "=", 
      RowBox[{"M", "-", 
       SqrtBox[
        RowBox[{
         SuperscriptBox["M", "2"], "-", 
         SuperscriptBox["a", "2"]}]]}]}], ";", 
     RowBox[{
      RowBox[{"rtorstar", "[", "r_", "]"}], "=", 
      RowBox[{"r", "+", 
       RowBox[{
        FractionBox[
         RowBox[{"2", "M", " "}], 
         RowBox[{"rplus", " ", "-", " ", "rminus"}]], 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"rplus", " ", 
           RowBox[{"Log", "[", 
            FractionBox[
             RowBox[{"r", "-", "rplus"}], 
             RowBox[{"2", "M"}]], "]"}]}], "-", 
          RowBox[{"rminus", " ", 
           RowBox[{"Log", "[", 
            FractionBox[
             RowBox[{"r", "-", "rminus"}], 
             RowBox[{"2", "M"}]], "]"}]}]}], ")"}]}]}]}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{"r0star", "=", 
      RowBox[{"rtorstar", "[", "r0", "]"}]}], ";", 
     RowBox[{"rsmin", "=", 
      RowBox[{"r0star", "-", 
       FractionBox["\[CapitalDelta]rstar", "2"], "-", 
       RowBox[{"l", "*", "\[CapitalDelta]rstar"}]}]}], ";", 
     RowBox[{"rsmax", "=", 
      RowBox[{"r0star", "+", 
       FractionBox["\[CapitalDelta]rstar", "2"], "+", 
       RowBox[{"l", "*", "\[CapitalDelta]rstar"}]}]}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{"rmatrixfactorminus", "=", 
      RowBox[{
       RowBox[{"Floor", "[", 
        FractionBox[
         RowBox[{"rsmin", "-", "rminapp"}], "d"], "]"}], "+", "1"}]}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{"rmatrixfactorplus", "=", 
      RowBox[{
       RowBox[{"Floor", "[", 
        FractionBox[
         RowBox[{"rmaxapp", "-", "rsmax"}], "d"], "]"}], "+", "1"}]}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{"rmin", "=", 
      RowBox[{"rsmin", "-", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"rmatrixfactorminus", "-", "1"}], ")"}], "*", "d"}]}]}], ";",
      "\[IndentingNewLine]", 
     RowBox[{"rmax", "=", 
      RowBox[{
       RowBox[{
        RowBox[{"(", 
         RowBox[{"rmatrixfactorplus", "-", "1"}], ")"}], "*", "d"}], "+", 
       "rsmax"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"guess", "[", "rstar_", "]"}], ":=", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"rstar", "\[LessEqual]", " ", 
         RowBox[{"-", "2"}]}], ",", 
        RowBox[{"rplus", "+", 
         RowBox[{"2", "*", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"1", "-", 
             SuperscriptBox["a", "2"]}], ")"}], 
           RowBox[{"(", 
            RowBox[{
             FractionBox["1", "rplus"], "-", 
             FractionBox["1", "2"]}], ")"}]], 
          RowBox[{"Exp", "[", 
           RowBox[{
            RowBox[{"(", 
             RowBox[{
              SuperscriptBox["a", "2"], "-", "rplus", "+", 
              RowBox[{
               RowBox[{"(", 
                RowBox[{"rplus", "-", "1"}], ")"}], "*", "rstar"}]}], ")"}], 
            "/", "rplus"}], "]"}]}]}], ",", 
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{
           RowBox[{"-", "2"}], "<", "rstar", "\[LessEqual]", " ", "1000"}], 
          ",", 
          RowBox[{"rplus", "+", 
           RowBox[{"2", 
            RowBox[{"(", 
             RowBox[{"ProductLog", "[", 
              RowBox[{"Exp", "[", 
               RowBox[{
                FractionBox["1", "2"], 
                RowBox[{"(", 
                 RowBox[{"rstar", "-", "rplus"}], ")"}]}], "]"}], "]"}], 
             ")"}]}]}], ",", 
          RowBox[{"rstar", "+", "rplus"}]}], "]"}]}], "]"}]}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"rstartor", "[", "rstar_", "]"}], ":=", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"rstar", "<", 
         RowBox[{"-", "50"}]}], ",", 
        RowBox[{"guess", "[", "rstar", "]"}], ",", 
        RowBox[{"r", "/.", 
         RowBox[{"FindRoot", "[", 
          RowBox[{
           RowBox[{
            RowBox[{
             RowBox[{"rtorstar", "[", "r", "]"}], "-", "rstar"}], "\[Equal]", 
            "0"}], ",", 
           RowBox[{"{", 
            RowBox[{"r", ",", 
             RowBox[{"guess", "[", "rstar", "]"}]}], "}"}], ",", 
           RowBox[{"Method", "\[Rule]", "\"\<Newton\>\""}]}], "]"}]}]}], 
       "]"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"imax", "=", 
      RowBox[{"Round", "[", 
       RowBox[{
        FractionBox[
         RowBox[{"rmax", "-", "rmin"}], "\[CapitalDelta]rstar"], "+", "1"}], 
       "]"}]}], ";", 
     RowBox[{"jmax", "=", 
      RowBox[{"Floor", "[", 
       RowBox[{
        FractionBox["\[Pi]", "\[CapitalDelta]\[Theta]"], "+", "1"}], "]"}]}], 
     ";", 
     RowBox[{"listr", "=", 
      RowBox[{
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{"Re", "[", 
          RowBox[{"rstartor", "[", "rstar", "]"}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{
          "rstar", ",", "rmin", ",", "rmax", ",", "\[CapitalDelta]rstar"}], 
          "}"}]}], "]"}], "//", "Quiet"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"listrstar", "=", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{"rtorstar", "[", 
         RowBox[{"listr", "[", 
          RowBox[{"[", "i", "]"}], "]"}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"i", ",", "1", ",", 
          RowBox[{"Length", "[", "listr", "]"}]}], "}"}]}], "]"}]}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{"list\[Theta]", "=", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"(", 
          RowBox[{"j", "-", "1"}], ")"}], "\[CapitalDelta]\[Theta]"}], ",", 
        RowBox[{"{", 
         RowBox[{"j", ",", "1", ",", "jmax"}], "}"}]}], "]"}]}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"\[CurlyPhi]", "[", "r_", "]"}], "=", 
      RowBox[{
       FractionBox["a", 
        RowBox[{"rplus", "-", "rminus"}]], 
       RowBox[{"Log", "[", 
        FractionBox[
         RowBox[{"r", "-", "rplus"}], 
         RowBox[{"r", "-", "rminus"}]], "]"}]}]}], ";", " ", 
     "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"\[CapitalDelta]", "[", "r_", "]"}], "=", 
      RowBox[{
       SuperscriptBox["r", "2"], "-", 
       RowBox[{"2", " ", "M", " ", "r"}], "+", 
       SuperscriptBox["a", "2"]}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"\[Psi]inr\[Theta]1try1", "=", 
        RowBox[{"Flatten", "[", 
         RowBox[{
          RowBox[{"Table", "[", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{
              RowBox[{"listrstar", "[", 
               RowBox[{"[", "i", "]"}], "]"}], ",", 
              RowBox[{"list\[Theta]", "[", 
               RowBox[{"[", "j", "]"}], "]"}], ",", 
              RowBox[{"2", "*", 
               RowBox[{"\[Psi]sol", "[", 
                RowBox[{"[", 
                 RowBox[{"i", ",", "j"}], "]"}], "]"}]}]}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"i", ",", "1", ",", "imax"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"j", ",", "1", ",", 
              RowBox[{"Length", "[", "list\[Theta]", "]"}]}], "}"}]}], "]"}], 
          ",", "1"}], "]"}]}], ",", "imax", ",", "jmax", ",", 
       "\[CapitalDelta]rstar", ",", "\[CapitalDelta]\[Theta]"}], "}"}]}]}], 
   "]"}]}]], "Input",
 CellChangeTimes->{{3.8418788446602097`*^9, 3.841878851910028*^9}, {
   3.841950653793818*^9, 3.8419506649063663`*^9}, {3.841951258783258*^9, 
   3.841951262242762*^9}, {3.841969890410781*^9, 3.841969893683804*^9}, {
   3.841978504868347*^9, 3.84197850917026*^9}, {3.842052212336247*^9, 
   3.842052214215041*^9}, 3.8420566777454367`*^9, {3.842056739944744*^9, 
   3.842056750604302*^9}},ExpressionUUID->"de7fb3a4-f3e3-4ca1-8da7-\
17a2caa6cc87"]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[StyleBox["Calculating Scalar Self Force ",
 FontSize->14]], "Section",
 CellChangeTimes->{{3.841951187310505*^9, 3.841951197700609*^9}, {
  3.842057045385477*^9, 
  3.84205705728644*^9}},ExpressionUUID->"bff0be23-c16f-4f1c-b775-\
22c761bd5c60"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"SSF", "[", 
    RowBox[{
    "n_", ",", " ", "m_", ",", " ", "a_", ",", " ", "r0_", ",", " ", 
     "rminapp_", ",", " ", "rmaxapp_", ",", " ", "d_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
      "rplus", ",", "rminus", ",", "\[CurlyPhi]", ",", "\[Phi]", ",", 
       "\[CapitalDelta]", ",", "\[Psi]atr\[Theta]sol", ",", "rtorstar", ",", 
       "r0star", ",", "imax", ",", "jmax", ",", "\[CapitalDelta]rstar1", ",", 
       "\[CapitalDelta]\[Theta]1", ",", "function\[Psi]", ",", 
       "d\[CapitalPsi]r", ",", "d\[Phi]r1", ",", "d\[Phi]\[Theta]", ",", 
       "d\[Phi]\[Phi]"}], "}"}], ",", 
     RowBox[{
      RowBox[{"rplus", "=", 
       RowBox[{"M", "+", 
        SqrtBox[
         RowBox[{
          SuperscriptBox["M", "2"], "-", 
          SuperscriptBox["a", "2"]}]]}]}], ";", 
      RowBox[{"rminus", "=", 
       RowBox[{"M", "-", 
        SqrtBox[
         RowBox[{
          SuperscriptBox["M", "2"], "-", 
          SuperscriptBox["a", "2"]}]]}]}], ";", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"\[CurlyPhi]", "[", "r_", "]"}], ":=", 
       RowBox[{"\[Phi]", "+", 
        RowBox[{
         FractionBox["a", 
          RowBox[{"rplus", "-", "rminus"}]], 
         RowBox[{"Log", "[", 
          FractionBox[
           RowBox[{"r", "-", "rplus"}], 
           RowBox[{"r", "-", "rminus"}]], "]"}]}]}]}], ";", " ", 
      "\[IndentingNewLine]", 
      RowBox[{"\[Phi]", "=", "0"}], ";", " ", 
      RowBox[{"t", "=", "0"}], ";", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"\[CapitalDelta]", "[", "r_", "]"}], ":=", 
       RowBox[{
        SuperscriptBox["r", "2"], "-", 
        RowBox[{"2", " ", "M", " ", "r"}], "+", 
        SuperscriptBox["a", "2"]}]}], ";", "\[IndentingNewLine]", 
      RowBox[{"\[Psi]atr\[Theta]sol", "=", 
       RowBox[{"\[Psi]atr\[Theta]", "[", 
        RowBox[{
        "n", ",", "m", ",", "a", ",", "r0", ",", "rminapp", ",", "rmaxapp", 
         ",", "d"}], "]"}]}], ";", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"rtorstar", "[", "r_", "]"}], "=", 
       RowBox[{"r", "+", 
        RowBox[{
         FractionBox[
          RowBox[{"2", "M", " "}], 
          RowBox[{"rplus", " ", "-", " ", "rminus"}]], 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"rplus", " ", 
            RowBox[{"Log", "[", 
             FractionBox[
              RowBox[{"r", "-", "rplus"}], 
              RowBox[{"2", "M"}]], "]"}]}], "-", 
           RowBox[{"rminus", " ", 
            RowBox[{"Log", "[", 
             FractionBox[
              RowBox[{"r", "-", "rminus"}], 
              RowBox[{"2", "M"}]], "]"}]}]}], ")"}]}]}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{"r0star", "=", 
       RowBox[{"rtorstar", "[", "r0", "]"}]}], ";", " ", 
      "\[IndentingNewLine]", 
      RowBox[{"imax", "=", 
       RowBox[{"\[Psi]atr\[Theta]sol", "[", 
        RowBox[{"[", "2", "]"}], "]"}]}], ";", "\[IndentingNewLine]", 
      RowBox[{"jmax", "=", 
       RowBox[{"\[Psi]atr\[Theta]sol", "[", 
        RowBox[{"[", "3", "]"}], "]"}]}], ";", 
      RowBox[{"(*", 
       RowBox[{"jmax", " ", "is", " ", "always", " ", "even", " ", "number"}],
        "*)"}], "\[IndentingNewLine]", 
      RowBox[{"\[CapitalDelta]rstar1", "=", 
       RowBox[{"\[Psi]atr\[Theta]sol", "[", 
        RowBox[{"[", "4", "]"}], "]"}]}], ";", "\[IndentingNewLine]", 
      RowBox[{"\[CapitalDelta]\[Theta]1", "=", 
       RowBox[{"\[Psi]atr\[Theta]sol", "[", 
        RowBox[{"[", "5", "]"}], "]"}]}], ";", "\[IndentingNewLine]", 
      RowBox[{"function\[Psi]", "=", 
       RowBox[{"Interpolation", "[", 
        RowBox[{
         RowBox[{"\[Psi]atr\[Theta]", "[", 
          RowBox[{
          "n", ",", "m", ",", "a", ",", "r0", ",", "rminapp", ",", "rmaxapp", 
           ",", "d"}], "]"}], "[", 
         RowBox[{"[", "1", "]"}], "]"}], "]"}]}], ";", "\[IndentingNewLine]", 
      
      RowBox[{"d\[CapitalPsi]r", "=", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", 
           RowBox[{"function\[Psi]", "[", 
            RowBox[{
             RowBox[{"r0star", "+", 
              RowBox[{"2", "\[CapitalDelta]rstar1"}]}], ",", 
             RowBox[{"\[Pi]", "/", "2"}]}], "]"}]}], "+", 
          RowBox[{"8", 
           RowBox[{"function\[Psi]", "[", 
            RowBox[{
             RowBox[{"r0star", "+", "\[CapitalDelta]rstar1"}], ",", 
             RowBox[{"\[Pi]", "/", "2"}]}], "]"}]}], "-", 
          RowBox[{"8", 
           RowBox[{"function\[Psi]", "[", 
            RowBox[{
             RowBox[{"r0star", "-", "\[CapitalDelta]rstar1"}], ",", 
             RowBox[{"\[Pi]", "/", "2"}]}], "]"}]}], "+", 
          RowBox[{"function\[Psi]", "[", 
           RowBox[{
            RowBox[{"r0star", "-", 
             RowBox[{"2", "\[CapitalDelta]rstar1"}]}], ",", 
            RowBox[{"\[Pi]", "/", "2"}]}], "]"}]}], ")"}], "/", 
        RowBox[{"(", 
         RowBox[{"12", "\[CapitalDelta]rstar1"}], ")"}]}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{"d\[Phi]r1", "=", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{
          FractionBox["1", "r0"], 
          RowBox[{"function\[Psi]", "[", 
           RowBox[{"r0star", ",", 
            RowBox[{"\[Pi]", "/", "2"}]}], "]"}], " ", "\[ImaginaryI]", " ", 
          "m", " ", 
          FractionBox["a", 
           RowBox[{
            RowBox[{"(", 
             RowBox[{"r0", "-", "rminus"}], ")"}], 
            RowBox[{"(", 
             RowBox[{"r0", "-", "rplus"}], ")"}]}]]}], "+", 
         RowBox[{
          FractionBox["1", "r0"], " ", "*", 
          FractionBox[
           RowBox[{
            SuperscriptBox["r0", "2"], "+", 
            SuperscriptBox["a", "2"]}], 
           RowBox[{"\[CapitalDelta]", "[", "r0", "]"}]], " ", 
          "d\[CapitalPsi]r"}], " ", "-", " ", 
         RowBox[{
          RowBox[{"function\[Psi]", "[", 
           RowBox[{"r0star", ",", 
            RowBox[{"\[Pi]", "/", "2"}]}], "]"}], "  ", "*", 
          FractionBox["1", 
           SuperscriptBox["r0", "2"]]}]}], ")"}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{"d\[Phi]\[Theta]", "=", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", 
           RowBox[{"function\[Psi]", "[", 
            RowBox[{"r0star", ",", 
             RowBox[{
              RowBox[{"\[Pi]", "/", "2"}], "+", 
              RowBox[{"2", "\[CapitalDelta]\[Theta]1"}]}]}], "]"}]}], "+", 
          RowBox[{"8", 
           RowBox[{"function\[Psi]", "[", 
            RowBox[{"r0star", ",", 
             RowBox[{
              RowBox[{"\[Pi]", "/", "2"}], "+", 
              "\[CapitalDelta]\[Theta]1"}]}], "]"}]}], "-", 
          RowBox[{"8", 
           RowBox[{"function\[Psi]", "[", 
            RowBox[{"r0star", ",", 
             RowBox[{
              RowBox[{"\[Pi]", "/", "2"}], "-", 
              "\[CapitalDelta]\[Theta]1"}]}], "]"}]}], "+", 
          RowBox[{"function\[Psi]", "[", 
           RowBox[{"r0star", ",", 
            RowBox[{
             RowBox[{"\[Pi]", "/", "2"}], "-", 
             RowBox[{"2", "\[CapitalDelta]\[Theta]1"}]}]}], "]"}]}], ")"}], 
        "/", 
        RowBox[{"(", 
         RowBox[{"12", "\[CapitalDelta]\[Theta]1"}], ")"}]}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{"d\[Phi]\[Phi]", "=", 
       RowBox[{
        FractionBox["1", "r0"], " ", 
        RowBox[{"function\[Psi]", "[", 
         RowBox[{"r0star", ",", 
          RowBox[{"\[Pi]", "/", "2"}]}], "]"}], "*", 
        RowBox[{"(", 
         RowBox[{"\[ImaginaryI]", " ", "m"}], ")"}]}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{"Return", "[", 
       RowBox[{"{", 
        RowBox[{"d\[Phi]r1", ",", "d\[Phi]\[Phi]"}], "}"}], "]"}]}]}], 
    "]"}]}], "\[IndentingNewLine]"}]], "Input",
 CellChangeTimes->{{3.841881254692977*^9, 3.841881313318398*^9}, {
   3.841881359310501*^9, 3.8418813756202517`*^9}, {3.841881407773102*^9, 
   3.841881564408929*^9}, {3.841950706195883*^9, 3.841950706377046*^9}, 
   3.8419523180607224`*^9, {3.841952925394446*^9, 3.841952925715225*^9}, {
   3.842056755609511*^9, 3.842056758852887*^9}, {3.842056982733437*^9, 
   3.842056994864375*^9}},ExpressionUUID->"ea56da7a-4e7e-4628-a2e6-\
63cff0cd404e"],

Cell[TextData[{
 StyleBox["You have to be careful when a \[NotEqual]0 \nd\[Phi]r1= ", 
  "Text"],
 StyleBox[Cell[BoxData[
  RowBox[{"(", 
   RowBox[{
    RowBox[{
     FractionBox["1", "r0"], 
     RowBox[{"function\[Psi]", "[", 
      RowBox[{"r0star", ",", 
       RowBox[{"\[Pi]", "/", "2"}]}], "]"}], " ", "\[ImaginaryI]", " ", "m", 
     " ", 
     FractionBox["a", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{"r0", "-", "rminus"}], ")"}], 
       RowBox[{"(", 
        RowBox[{"r0", "-", "rplus"}], ")"}]}]]}], "+", 
    RowBox[{
     FractionBox["1", "r0"], " ", "*", 
     FractionBox[
      RowBox[{
       SuperscriptBox["r0", "2"], "+", 
       SuperscriptBox["a", "2"]}], 
      RowBox[{"\[CapitalDelta]", "[", "r0", "]"}]], " ", "d\[CapitalPsi]r"}], 
    " ", "-", " ", 
    RowBox[{
     RowBox[{"function\[Psi]", "[", 
      RowBox[{"r0star", ",", 
       RowBox[{"\[Pi]", "/", "2"}]}], "]"}], "  ", "*", 
     FractionBox["1", 
      SuperscriptBox["r0", "2"]]}]}], ")"}]], "Text",
  CellChangeTimes->{{3.841881254692977*^9, 3.841881313318398*^9}, {
    3.841881359310501*^9, 3.8418813756202517`*^9}, {3.841881407773102*^9, 
    3.841881564408929*^9}, {3.841950706195883*^9, 3.841950706377046*^9}, 
    3.8419523180607224`*^9},ExpressionUUID->
  "1a195ed3-f3ae-4c59-ad5b-874577c37e58"], "Text"],
 StyleBox["  * ", "Text"],
 StyleBox[Cell[BoxData[
  FormBox[
   SuperscriptBox["e", 
    RowBox[{"i", " ", "m", " ", "\[CurlyPhi]"}]], TraditionalForm]], "Text",
  ExpressionUUID->"d3e26309-6383-4d86-bab5-c5eac8aa12da"], "Text"],
 StyleBox["\n\[CurlyPhi] = \[Phi] + \[CapitalDelta]\[Phi][r] \n\
\[CapitalDelta]\[Phi][r] = ", "Text"],
 StyleBox[Cell[BoxData[
  FormBox[
   FractionBox["a", 
    RowBox[{
     SuperscriptBox["r", "+"], "-", 
     SuperscriptBox["r", "-"]}]], TraditionalForm]], "Text",ExpressionUUID->
  "37184618-2f29-4ab8-bdaf-7a663083e7a4"], "Text"],
 StyleBox[" ", "Text"],
 StyleBox[Cell[BoxData[
  FormBox[
   RowBox[{"ln", "|", 
    FractionBox[
     RowBox[{"r", "-", 
      SuperscriptBox["r", "+"]}], 
     RowBox[{"r", "-", 
      SuperscriptBox["r", "-"]}]]}], TraditionalForm]], "Text",ExpressionUUID->
  "dda0f025-21a4-4f50-9ee0-aea210aff1b3"], "Text"],
 StyleBox["| \nand therefore, when a \[NotEqual] 0, \[CurlyPhi] \[NotEqual] \
0, and therefore ", "Text"],
 StyleBox[Cell[BoxData[
  FormBox[
   SuperscriptBox["e", "im\[CurlyPhi]"], TraditionalForm]], "Text",
  ExpressionUUID->"fa982728-8c91-4cae-a96a-2cffb3c1bb5c"], "Text"],
 StyleBox[" \[NotEqual] 1 ", "Text"]
}], "Text",
 CellChangeTimes->{{3.8420585983481894`*^9, 
  3.842058617168548*^9}},ExpressionUUID->"258f19a2-2dd7-46c7-9aef-\
c83dd7378ed1"]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[StyleBox["Scalar Self Force Results ",
 FontSize->12]], "Section",
 CellChangeTimes->{
  3.841951039858615*^9, {3.841951476561838*^9, 3.8419514829457407`*^9}, {
   3.842057203408647*^9, 
   3.8420572213492126`*^9}},ExpressionUUID->"b98870f0-36b5-42da-88a7-\
fa4f17c78fe5"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"ssf", "=", 
    RowBox[{"SSF", "[", 
     RowBox[{
     "n", ",", "m", ",", "a", ",", "r0", ",", "rminapp", ",", "rmaxapp", ",", 
      "d"}], "]"}]}], " ", ";"}], " "}], "\[IndentingNewLine]", 
 RowBox[{"Fr", " ", "=", " ", 
  RowBox[{"ssf", "[", 
   RowBox[{"[", "1", "]"}], "]"}]}], "\[IndentingNewLine]", 
 RowBox[{"F\[Phi]", " ", "=", " ", 
  RowBox[{"ssf", "[", 
   RowBox[{"[", "2", "]"}], "]"}]}]}], "Input",
 CellChangeTimes->{{3.841881555960896*^9, 3.841881581494005*^9}, {
  3.841949393960436*^9, 3.8419493963008347`*^9}, {3.84200246371721*^9, 
  3.8420024653227654`*^9}, {3.8420586837617903`*^9, 
  3.842058719253037*^9}},ExpressionUUID->"f6cf8076-dd93-4ef1-bf1a-\
806c6d1b5fca"]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1128, 783},
WindowMargins->{{Automatic, 139}, {Automatic, 0}},
FrontEndVersion->"12.3 for Mac OS X x86 (64-bit) (July 9, 2021)",
StyleDefinitions->"Default.nb",
ExpressionUUID->"e3f01833-bdc3-4df7-877e-a5c7c8d1abf4"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[580, 22, 487, 10, 98, "Title",ExpressionUUID->"f37d0bbd-96e4-4ff2-bd61-0873683266cb"],
Cell[1070, 34, 315, 8, 58, "Text",ExpressionUUID->"c48cc65b-0960-4685-b4cc-eefd4674b470"],
Cell[1388, 44, 278, 5, 30, "Input",ExpressionUUID->"3ebbb7f6-82da-4b6a-969d-6d7c8cace00a"],
Cell[CellGroupData[{
Cell[1691, 53, 254, 5, 49, "Section",ExpressionUUID->"3ff7a836-f66d-437c-be89-72f65d0c4e26"],
Cell[1948, 60, 248, 6, 35, "Text",ExpressionUUID->"74cbdda4-5c01-4929-9bad-c226b338e867"],
Cell[2199, 68, 5350, 112, 262, "Input",ExpressionUUID->"67ca88b1-82c0-48f4-bfff-de7e4dc3445f"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7586, 185, 233, 5, 49, "Section",ExpressionUUID->"7690f977-825a-4420-8f26-9d398db58f14"],
Cell[7822, 192, 464, 12, 73, "Input",ExpressionUUID->"0bd965e4-6fe3-4117-b842-a4a52a8f9465"],
Cell[8289, 206, 1320, 38, 95, "Input",ExpressionUUID->"b8f7e19d-912d-4d8f-b461-f8dd43e2335e"]
}, Open  ]],
Cell[CellGroupData[{
Cell[9646, 249, 208, 4, 49, "Section",ExpressionUUID->"d592f90c-bd56-4cff-80ab-3f57113c647a"],
Cell[9857, 255, 5548, 151, 598, "Input",ExpressionUUID->"804e41a7-b548-4be0-a4cd-bab3656cf3b7"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15442, 411, 220, 4, 49, "Section",ExpressionUUID->"d50da622-bbea-4160-8a95-8a8039f7f9ca"],
Cell[15665, 417, 5496, 96, 83, "Text",ExpressionUUID->"cb8b90ac-bff5-45ac-9395-e9350faad53c"],
Cell[21164, 515, 14906, 354, 703, "Input",ExpressionUUID->"2853b76a-c8b5-4a75-a15f-d5adab19be56"],
Cell[36073, 871, 147, 3, 52, "Input",ExpressionUUID->"e250d9c9-2936-4378-8938-b020493b0bf9"],
Cell[36223, 876, 174, 3, 35, "Text",ExpressionUUID->"d4ad0937-3b06-4111-a428-5e24705fc965"],
Cell[36400, 881, 9515, 249, 365, "Input",ExpressionUUID->"65465a1b-ab93-409d-b0b1-7b5ef9f3b93b"]
}, Open  ]],
Cell[CellGroupData[{
Cell[45952, 1135, 208, 4, 49, "Section",ExpressionUUID->"8c10d703-98ed-42ee-a933-6b00581e0fd4"],
Cell[46163, 1141, 957, 24, 81, "Text",ExpressionUUID->"1fa7bd66-d626-4ffe-9179-25848ed43ae5"],
Cell[47123, 1167, 24134, 597, 1459, "Input",ExpressionUUID->"ce3fdf9e-9c4f-49a1-aec3-2b152c41dbf3"]
}, Open  ]],
Cell[CellGroupData[{
Cell[71294, 1769, 258, 5, 49, "Section",ExpressionUUID->"c1bb7be7-b7ef-469c-9a37-d6e95723db1a"],
Cell[71555, 1776, 1102, 32, 72, "Text",ExpressionUUID->"b62b6f9d-e93c-4a38-9d15-f370d05ded10"],
Cell[72660, 1810, 44575, 1099, 1963, "Input",ExpressionUUID->"43ac210c-3c52-464f-956a-020439a230f7"]
}, Open  ]],
Cell[CellGroupData[{
Cell[117272, 2914, 242, 5, 49, "Section",ExpressionUUID->"6a8a1fa7-1ff7-4585-9a0b-e7d392fb85cd"],
Cell[117517, 2921, 791, 24, 38, "Text",ExpressionUUID->"7952f6b6-558d-481f-91c7-d1e954f6502e"],
Cell[118311, 2947, 1890, 46, 174, "Input",ExpressionUUID->"daf6ed27-85f7-4e57-82f7-7b8327b778a7"],
Cell[CellGroupData[{
Cell[120226, 2997, 491, 10, 30, "Input",ExpressionUUID->"53622069-b824-4e52-97dd-8c6c7627ce96"],
Cell[120720, 3009, 9739, 241, 142, "Output",ExpressionUUID->"aed58c13-6692-4302-af8c-00360f681869"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[130508, 3256, 273, 5, 49, "Section",ExpressionUUID->"f19d74db-9633-4dfc-bba9-039d192cb38f"],
Cell[130784, 3263, 1048, 31, 58, "Text",ExpressionUUID->"48901350-78e5-4879-8c96-879a3aecdb6f"],
Cell[131835, 3296, 9210, 247, 781, "Input",ExpressionUUID->"de7fb3a4-f3e3-4ca1-8da7-17a2caa6cc87"]
}, Open  ]],
Cell[CellGroupData[{
Cell[141082, 3548, 258, 5, 49, "Section",ExpressionUUID->"bff0be23-c16f-4f1c-b775-22c761bd5c60"],
Cell[141343, 3555, 8282, 209, 647, "Input",ExpressionUUID->"ea56da7a-4e7e-4628-a2e6-63cff0cd404e"],
Cell[149628, 3766, 2659, 72, 144, "Text",ExpressionUUID->"258f19a2-2dd7-46c7-9aef-c83dd7378ed1"]
}, Open  ]],
Cell[CellGroupData[{
Cell[152324, 3843, 286, 6, 47, "Section",ExpressionUUID->"b98870f0-36b5-42da-88a7-fa4f17c78fe5"],
Cell[152613, 3851, 739, 18, 73, "Input",ExpressionUUID->"f6cf8076-dd93-4ef1-bf1a-806c6d1b5fca"]
}, Open  ]]
}, Open  ]]
}
]
*)

