#!/usr/bin/perl
use strict;

use warnings;
 
use Text::CSV_XS;

#module Switch
use Switch;

use Class::Fields;

#@utor: Hugo Leite
#Versao: 4.0
#Data: 14/11/2018
#incluir todos os trios (grupo e controle)

# my $filename = 'D:\hugo\doutoradoBiotecHugo\genotype_call_f15_teste.txt';
my $filename = 'F:\doutorado\dados\resultadoCodeGenotype\resultadoGenotypeCallF08-2F.csv';
 
my $file = $filename or die "Need to get CSV file on the command line\n";

#my $csv = Text::CSV_XS->new({
#    sep_char => qq|\t|
#});
 
 my $csv = Text::CSV_XS->new ({ sep_char => "," });
         $csv->sep_char (",");
 # my $c = $csv->sep_char;
 
 my @fields;
 
 my $probe_set_id = '';
 my $call_code_mother = '';
 my $tx_confidence_mother = '';
 my $vl_signal_A_mother = '';
 my $vl_signal_B_mother = '';
 my $call_base_mother = '';
 my $call_code_offspring = '';
 my $tx_confidence_offspring = '';
 my $vl_signal_A_offspring = '';
 my $vl_signal_B_offspring = '';
 my $call_base_offspring = '';
 my $call_code_father = '';
 my $tx_confidence_father = '';
 my $vl_signal_A_father = '';
 my $vl_signal_B_father = '';
 my $call_base_father = '';
 my $dbSNP = '';
 my $position = '';
 my $chromosome_id = '';
 my $origem_mutacao = '';
 my $tipo_mutacao1 = '';
 my $tipo_mutacao2= '';
 my $tipo_mutacao3= '';
 my $mutacao_genotipo = '';
 my $familia = '';
     
open(my $data, '<:encoding(utf8)', $file) or die "Could not open '$file' $!\n";
     
# open(my $fh_log, '>>', 'D:\hugo\doutoradoBiotecHugo\output.log.txt');
open(my $fh_log, '>>', 'F:\doutorado\dados\resultadosStatusCNV\statusGeralF08-F2.csv');

 
while (my $fields = $csv->getline( $data )) {
  
  chomp $fields ;
  $fields =~ s/\s*#.*$//;
  
  
  $probe_set_id             = $fields->[0];
  $call_code_father         = $fields->[1];
  $tx_confidence_father     = $fields->[2];
  $vl_signal_A_father       = $fields->[3];
  $vl_signal_B_father       = $fields->[4];
  $call_base_father         = $fields->[5];
  $call_code_mother         = $fields->[6];
  $tx_confidence_mother     = $fields->[7];
  $vl_signal_A_mother       = $fields->[8];
  $vl_signal_B_mother       = $fields->[9];
  $call_base_mother         = $fields->[10];
  $call_code_offspring      = $fields->[11];
  $tx_confidence_offspring  = $fields->[12];
  $vl_signal_A_offspring    = $fields->[13];
  $vl_signal_B_offspring    = $fields->[14];
  $call_base_offspring      = $fields->[15];     
  $dbSNP                    = $fields->[16];
  $chromosome_id            = $fields->[17];
  $position                 = $fields->[18];
  $origem_mutacao           = $fields->[19];
  $tipo_mutacao1             = $fields->[20]; 
  $tipo_mutacao2             = $fields->[21]; 
  $tipo_mutacao3            = $fields->[22]; 
  $mutacao_genotipo         = $fields->[23];    
  $familia                  = $fields->[24];
     
  @fields = ($probe_set_id,$call_code_father,$tx_confidence_father,
                   $vl_signal_A_father,$vl_signal_B_father,$call_base_father,                   
                   $call_code_mother,$tx_confidence_mother,
                   $vl_signal_A_mother,$vl_signal_B_mother,$call_base_mother,
                   $call_code_offspring,$tx_confidence_offspring,
                   $vl_signal_A_offspring,$vl_signal_B_offspring,$call_base_offspring,                   
                   $dbSNP,$chromosome_id,$position,$origem_mutacao, 
                   $tipo_mutacao1,$tipo_mutacao2,$tipo_mutacao3, $mutacao_genotipo, $familia
               );
  
  my $reg = '';
  $reg = join(',',@fields);
  
  my $strDentroCNV = ",Dentro da CNV,";
  my $strForaCNV =   ",Fora da CNV,";
    
  #print ($chromosome_id);
  #print ($position);
  #print ($call_code_offspring);  
 
  #Familia: Grupo Caso e Grupo Controle
          switch($chromosome_id) {
              case '1' {
                if(($position >= '35629051') and ($position <= '35635760'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '62107805') and ($position <= '62120073')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '62549504') and ($position <= '62553521'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '111829494') and ($position <= '111830918')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '207816479') and ($position <= '207822856')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '220158790') and ($position <= '220160649')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '151052341') and ($position <= '151056637'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '175454789') and ($position <= '175456321')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '215442443') and ($position <= '215464963')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '24754405') and ($position <= '24764180'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '111829652') and ($position <= '111831915')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '201678203') and ($position <= '201690519')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '240393939') and ($position <= '240395143')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '72771520') and ($position <= '72812440'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '152761910') and ($position <= '152763072'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '152767453') and ($position <= '152768688')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '53626798') and ($position <= '53632424'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '100816945') and ($position <= '100823035')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '108733635') and ($position <= '100823035')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '248619768') and ($position <= '248639486')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '150388317') and ($position <= '150389392'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '35629051') and ($position <= '35635760'))  { #Comeca o grupo caso           
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '62107805') and ($position <= '62120073')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '175454789') and ($position <= '175456321')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '215442443') and ($position <= '215464963')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '10370388') and ($position <= '10377970'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '80210590') and ($position <= '80258823'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '2098292') and ($position <= '2188998')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '1616989') and ($position <= '1652775')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '89427127') and ($position <= '89428877')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '227483824') and ($position <= '227486981')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '167977685') and ($position <= '167988577'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '175454789') and ($position <= '175456321')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '196827841') and ($position <= '196877037')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '111829494') and ($position <= '111830918'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '150388317') and ($position <= '150389392')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '200139281') and ($position <= '200142317')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '249206290') and ($position <= '249206971'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '89423588') and ($position <= '89428877'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '2' {
                if(($position >= '12770') and ($position <= '75345'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '176929982') and ($position <= '176933378')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '178707958') and ($position <= '178716348')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '238552724') and ($position <= '238560231')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '159957765') and ($position <= '159960960'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '106383737') and ($position <= '106388948'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '98154574') and ($position <= '98162176'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '158996505') and ($position <= '159008503'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '169674181') and ($position <= '169680704')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '213385031') and ($position <= '213387563')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '35932261') and ($position <= '35944654'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '73184771') and ($position <= '73195576')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '83276739') and ($position <= '83284392')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '84787384') and ($position <= '84795916')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '228076146') and ($position <= '228079266'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '44790184') and ($position <= '44791621'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '176929982') and ($position <= '176933378')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '208350612') and ($position <= '208359547')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '240288365') and ($position <= '240288901'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '76736293') and ($position <= '76754936'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '35926022') and ($position <= '36000447'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '159957765') and ($position <= '159960960')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '100391602') and ($position <= '100392471'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '136032966') and ($position <= '136040551')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '168209305') and ($position <= '168216529')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '180652879') and ($position <= '180658096')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '169674181') and ($position <= '169679471'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '3' {
                if(($position >= '136019293') and ($position <= '136031478'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '78833864') and ($position <= '78834824'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '183265391') and ($position <= '183273129')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '69173374') and ($position <= '69183835'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '117958785') and ($position <= '117971959')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '100805204') and ($position <= '100815591'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '13678049') and ($position <= '13688871'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '107040138') and ($position <= '107049245')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '170746996') and ($position <= '170749282')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '59833700') and ($position <= '59836600'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '15743337') and ($position <= '15754329'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '97779709') and ($position <= '97786424')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '145246579') and ($position <= '145267800')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '196507491') and ($position <= '196508551')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '118783330') and ($position <= '118798590'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '62714754') and ($position <= '62715847'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '195751629') and ($position <= '195752260')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '53039203') and ($position <= '53044471'))  {    #comeca o grupo caso        
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '13719043') and ($position <= '13759226')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '2654251') and ($position <= '2655924'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '40257952') and ($position <= '40261973'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '98936626') and ($position <= '98950964')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '131290997') and ($position <= '131299232')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '229582') and ($position <= '234924'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '175300737') and ($position <= '175303031')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '69958119') and ($position <= '69961028'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }  
              case '4' {
                if(($position >= '68345') and ($position <= '86848'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '21368473') and ($position <= '21385209')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '165098559') and ($position <= '165112180')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '95948704') and ($position <= '95953319'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '69435888') and ($position <= '69485827'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '176636758') and ($position <= '176646378')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '93579864') and ($position <= '93593652'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '172987813') and ($position <= '172989506')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '186542638') and ($position <= '186566263')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '70389847') and ($position <= '70401338'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '165083494') and ($position <= '165112180'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '68889374') and ($position <= '68890347'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '73419420') and ($position <= '73428729')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '37387518') and ($position <= '37397767'))  {   #comeca o grupo caso         
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '266834') and ($position <= '268863'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '169474971') and ($position <= '169479436')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '35486207') and ($position <= '35494145'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '84168238') and ($position <= '84171758')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '95948704') and ($position <= '95953319')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '156879310') and ($position <= '156880335')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '159128616') and ($position <= '159130676')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '159542508') and ($position <= '159547607')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '69435888') and ($position <= '69485966'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '69536712') and ($position <= '69558258')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '84162151') and ($position <= '84171758')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '5' {
                if(($position >= '150177170') and ($position <= '150202248'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '70978068') and ($position <= '70990820')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '135208907') and ($position <= '135214816'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '150205040') and ($position <= '150218591')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '15718208') and ($position <= '15720451'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '140218725') and ($position <= '140231827')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '177807083') and ($position <= '177818805')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '112513119') and ($position <= '112515194'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '120091003') and ($position <= '120104988')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '168726085') and ($position <= '168736211')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '1286129') and ($position <= '1350237'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '70978068') and ($position <= '70990820')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '116020772') and ($position <= '116041606')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '180374483') and ($position <= '180418332'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '58724078') and ($position <= '58726567'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '17341050') and ($position <= '17359260'))  {  #comeca o grupo caso          
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '168726085') and ($position <= '168734887')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '6563300') and ($position <= '6564087'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '150177170') and ($position <= '150218591'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '42680341') and ($position <= '42682673')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '150055721') and ($position <= '150071659')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '155471683') and ($position <= '155482716')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '150174891') and ($position <= '150202248'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '139182025') and ($position <= '139183755'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '180378753') and ($position <= '180406955')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '36952082') and ($position <= '36952706'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '95708938') and ($position <= '95711940')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '150205040') and ($position <= '150211470')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '150216798') and ($position <= '150218591')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '6' {
                if(($position >= '254253') and ($position <= '294911'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '6254080') and ($position <= '6255235')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '99826246') and ($position <= '99841595')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '31386057') and ($position <= '31391680'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '252596') and ($position <= '253296'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '53931053') and ($position <= '53931790')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '64759581') and ($position <= '64761860')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '77436849') and ($position <= '77455232')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '32688023') and ($position <= '32689362'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '74590396') and ($position <= '74601724')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '11755898') and ($position <= '11759114'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '14623923') and ($position <= '14637470')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '51874750') and ($position <= '51878315')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '134266254') and ($position <= '134277956')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '32687328') and ($position <= '32689146'))  { #aqui comeca o grupo caso           
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '120767727') and ($position <= '120774907')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '31286291') and ($position <= '31296438'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '29580873') and ($position <= '29585573'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '29837157') and ($position <= '29921739')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '294123') and ($position <= '294824'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '31286291') and ($position <= '31296438')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '66356588') and ($position <= '66358664')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '102043630') and ($position <= '102044993')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '52624205') and ($position <= '52630666'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '53931053') and ($position <= '53931790')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '102043630') and ($position <= '102044993')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '103069721') and ($position <= '103109065')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '113920825') and ($position <= '113942111')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '134150455') and ($position <= '134156912')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '31286291') and ($position <= '31314589'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '29836740') and ($position <= '29921739'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '7' {
                if(($position >= '159056247') and ($position <= '159119707'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '13441667') and ($position <= '13450842')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '34421535') and ($position <= '34441101')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '46258236') and ($position <= '46268517')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '91714854') and ($position <= '91719608'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '92669843') and ($position <= '92671957')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '36200453') and ($position <= '36209680'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '39501154') and ($position <= '39503477')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '103600364') and ($position <= '103601323')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '140161143') and ($position <= '140169340')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '142475398') and ($position <= '142486482')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '156391776') and ($position <= '156394215')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '77474536') and ($position <= '77476822'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '150553743') and ($position <= '150559408'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '154508895') and ($position <= '154511524')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '24751224') and ($position <= '24756098'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '142475398') and ($position <= '142486482')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '147011387') and ($position <= '147012227')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '43757991') and ($position <= '43761096'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '39399651') and ($position <= '39404742'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '24753651') and ($position <= '24756098'))  {#comeca o grupo caso           
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '89321706') and ($position <= '89333541')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '94700459') and ($position <= '94701845'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '150553743') and ($position <= '150572384')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '7883959') and ($position <= '7888519'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '38293949') and ($position <= '38333090'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '142475398') and ($position <= '142486482'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '38330766') and ($position <= '38333090'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '142475398') and ($position <= '142485774')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '8' {
                if(($position >= '146218161') and ($position <= '146295771'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '42093804') and ($position <= '42103322')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '102621452') and ($position <= '102625699')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '65915861') and ($position <= '65927737'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '112281277') and ($position <= '112294551')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '4776974') and ($position <= '4784519'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '104708431') and ($position <= '104717618')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '112281405') and ($position <= '112294551')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '39247097') and ($position <= '39386952'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '12644843') and ($position <= '12652513')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '23240060') and ($position <= '23249100')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '22014759') and ($position <= '22019897'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '32131653') and ($position <= '32134482'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '11825093') and ($position <= '11830710'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '40701486') and ($position <= '40708364')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '81004137') and ($position <= '81009075')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '85295121') and ($position <= '85297733')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '114111090') and ($position <= '114118906')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '136620672') and ($position <= '136624952')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '8729760') and ($position <= '8730572'))  {   #comeca o grupo caso         
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '13046211') and ($position <= '13052926')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '24145007') and ($position <= '24151495')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '39213948') and ($position <= '39230312')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '85262869') and ($position <= '85268668')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '22492051') and ($position <= '22499169'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '39247097') and ($position <= '39384337'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '113262902') and ($position <= '113266695')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '8729760') and ($position <= '8730598'))  {            
                      say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '82693348') and ($position <= '82695743')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '8689824') and ($position <= '8690501'))  {            
                      say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '33760126') and ($position <= '33770070')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '125425987') and ($position <= '125437614')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '88255963') and ($position <= '88275814'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '91617193') and ($position <= '91633669')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }
              }  
              case '9' {
                if(($position >= '17936627') and ($position <= '17949453'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '73440858') and ($position <= '73451779')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '138211367') and ($position <= '138219716')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '2144686') and ($position <= '2150662'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '79550416') and ($position <= '79567014'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '114711368') and ($position <= '114726806')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '17936627') and ($position <= '17949453'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '7471166') and ($position <= '7484938'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '27984304') and ($position <= '27988069'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '71740193') and ($position <= '71742977'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '19023612') and ($position <= '19026542'))  { #comeca o grupo caso           
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '71740193') and ($position <= '71742977')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '34108201') and ($position <= '34114594'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '21121141') and ($position <= '21130807'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '138311547') and ($position <= '138356131'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '4629337') and ($position <= '4634106'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '10' {
                if(($position >= '11117695') and ($position <= '11130082'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '114112007') and ($position <= '114116826'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '124358180') and ($position <= '124373173')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '47058778') and ($position <= '47059808'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '11117695') and ($position <= '11130082'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '54234584') and ($position <= '54244612')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '81446577') and ($position <= '81464341'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '34659910') and ($position <= '34670662'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '23669246') and ($position <= '23676339'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '51000580') and ($position <= '51015644'))  {  #comeca o grupo caso          
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '88547443') and ($position <= '88558425')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '124358180') and ($position <= '124373173')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '88524482') and ($position <= '88535015'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '9993321') and ($position <= '9999708'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '24377660') and ($position <= '24379026')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '87894149') and ($position <= '87896024')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '114112007') and ($position <= '114116826')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '132987305') and ($position <= '132992938')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '89679699') and ($position <= '89680719')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '82738382') and ($position <= '82751539'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '96767048') and ($position <= '96768344')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '89498942') and ($position <= '89504978'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '132987305') and ($position <= '132992938')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '78258068') and ($position <= '78260572'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '11' {
                if(($position >= '134840587') and ($position <= '134938470'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '120979113') and ($position <= '120980267')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '22343302') and ($position <= '22355160'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '81503551') and ($position <= '81517158')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '3766584') and ($position <= '3768305'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '48598353') and ($position <= '48611661')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '121954569') and ($position <= '121958520')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '103167191') and ($position <= '103168414'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '81503551') and ($position <= '81516799'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '97862991') and ($position <= '97865064')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '107792538') and ($position <= '107811265')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '5826030') and ($position <= '5829038'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '5522174') and ($position <= '5523581'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '128703685') and ($position <= '128707538')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '103167191') and ($position <= '103168414'))  {#comeca o grupo caso           
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '5271581') and ($position <= '5277199'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '131779926') and ($position <= '103168414'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '103357272') and ($position <= '103361374'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '12' {
               if(($position >= '2252689') and ($position <= '2254259'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '96238253') and ($position <= '96244754')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '117579572') and ($position <= '117595930')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '24065533') and ($position <= '24070994'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '72184395') and ($position <= '72190025')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '33301815') and ($position <= '33304553'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '93769354') and ($position <= '93778522')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '114771834') and ($position <= '114775067')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '99797795') and ($position <= '99798577'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '115145760') and ($position <= '115149241'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '26009174') and ($position <= '26013872'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '66809643') and ($position <= '66812346')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '86069573') and ($position <= '86084166')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '91522032') and ($position <= '91533760')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '93766503') and ($position <= '93772631')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '128919555') and ($position <= '128923661')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '5787423') and ($position <= '5794223'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '121403946') and ($position <= '121407466'))  {  #comeca o grupo caso          
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '48724300') and ($position <= '48725402'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '72992904') and ($position <= '73000019'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '9967906') and ($position <= '9975878'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '24065966') and ($position <= '24070994')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '101207965') and ($position <= '101214196')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '103228016') and ($position <= '103235233')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '11220826') and ($position <= '11247266'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '38970331') and ($position <= '38971134')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '13' {
                if(($position >= '115044301') and ($position <= '115107733'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '20485142') and ($position <= '20485807'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '25028928') and ($position <= '25029858')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '44477385') and ($position <= '44485879')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '67176797') and ($position <= '67178094')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '87474728') and ($position <= '87487206')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '89991826') and ($position <= '90000312')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '31925077') and ($position <= '31937810'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '59081993') and ($position <= '59098436'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '114140974') and ($position <= '114158950')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '67176205') and ($position <= '67178332'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '57763133') and ($position <= '57764150'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '78509880') and ($position <= '78523348'))  { #comeca o grupo caso           
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '20482870') and ($position <= '20485732'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '41471239') and ($position <= '41484874')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '87474728') and ($position <= '87487206')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '27997998') and ($position <= '27999872')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '20482870') and ($position <= '20485732'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '60615604') and ($position <= '60632677')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '89991826') and ($position <= '90000514')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '110387922') and ($position <= '110411329'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }  
              case '14' {
                if(($position >= '23921434') and ($position <= '23922240'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '44658946') and ($position <= '44671595')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '47515487') and ($position <= '47520227')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '74008368') and ($position <= '74024031')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '22855144') and ($position <= '22940138'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '30166534') and ($position <= '30177999'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '74008368') and ($position <= '74024031')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '96343859') and ($position <= '96348869')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '96343859') and ($position <= '96348869'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '40608927') and ($position <= '40621990'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '66068513') and ($position <= '66075201')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '96343859') and ($position <= '96348869')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '25867958') and ($position <= '25882388'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '47429737') and ($position <= '47438853'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '47518066') and ($position <= '47520227')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '23921561') and ($position <= '23922240'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '88687170') and ($position <= '88691336'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '74008368') and ($position <= '74024031'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '15' {
                if(($position >= '27629288') and ($position <= '27630898'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '67017221') and ($position <= '67034047'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '56950886') and ($position <= '56956628'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '76891727') and ($position <= '76895331')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '23286571') and ($position <= '23290819'))  {  #comeca o grupo caso          
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '62166587') and ($position <= '62170347')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '23191760') and ($position <= '23213566'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '42647929') and ($position <= '42651648')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '52627133') and ($position <= '52628340'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '16' {
                if(($position >= '85880') and ($position <= '113637'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '83581103') and ($position <= '83583503')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '87321348') and ($position <= '87332986')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '55796375') and ($position <= '55810194'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '85880') and ($position <= '113637'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '78373323') and ($position <= '78379573')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '89836995') and ($position <= '89838805'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '83412636') and ($position <= '83414483'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '83330709') and ($position <= '83332959'))  {  #comeca o grupo caso          
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '7339577') and ($position <= '7340639'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '76500619') and ($position <= '76504659'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '13293988') and ($position <= '13298355'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '17479996') and ($position <= '17481773'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '17' {
                if(($position >= '9474') and ($position <= '59056'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '27697618') and ($position <= '27710963')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '39423000') and ($position <= '39430518')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '44046705') and ($position <= '44047707')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '9870231') and ($position <= '9877173'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '34440082') and ($position <= '34477480'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '51903103') and ($position <= '51910984'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '44190670') and ($position <= '44201470'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '16496388') and ($position <= '16505645'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '43754098') and ($position <= '43778410'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '44135826') and ($position <= '44145588')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '43754098') and ($position <= '43778410'))  { #comeca o grupo caso           
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '2399487') and ($position <= '2402229'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '55594990') and ($position <= '55601038')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '39423000') and ($position <= '39432827'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '16577027') and ($position <= '16581801'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '18' {
                if(($position >= '8380158') and ($position <= '8391031'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '69997866') and ($position <= '70006787')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '13937257') and ($position <= '13939404'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '50906030') and ($position <= '50909842')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '49880817') and ($position <= '49882589'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '69997866') and ($position <= '70006787')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '46642529') and ($position <= '46643199'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '48135051') and ($position <= '48140905')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '62512067') and ($position <= '62516230')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '74950944') and ($position <= '74967869')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '74950944') and ($position <= '74960117'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '48135051') and ($position <= '48140905'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '51899481') and ($position <= '51903129')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '48135051') and ($position <= '48140905'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '49880817') and ($position <= '49882589'))  { #comeca o grupo caso           
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '61374289') and ($position <= '61379501'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }  
              case '19' {
                if(($position >= '56864742') and ($position <= '56874482'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '6982587') and ($position <= '6995982'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '52142338') and ($position <= '52148184')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '29692896') and ($position <= '29702250'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '52590876') and ($position <= '52593046'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '56265808') and ($position <= '56268416'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '23583734') and ($position <= '23603182'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '24322835') and ($position <= '24325212')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '41345129') and ($position <= '41357039'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '57733212') and ($position <= '57734315')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '35663842') and ($position <= '35666034'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '41345314') and ($position <= '41360561'))  { #comeca o grupo caso           
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '54722727') and ($position <= '54741292'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '56864742') and ($position <= '56874482'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '54722671') and ($position <= '54741306'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '20' {
                if(($position >= '40723762') and ($position <= '40732807'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '43311368') and ($position <= '43316655'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '23557488') and ($position <= '23561418'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '16540464') and ($position <= '16543083'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif(($position >= '16662744') and ($position <= '16667869'))  { #comeca o grupo caso           
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '35920054') and ($position <= '35926406'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '40723762') and ($position <= '40732807'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '21' {
                if(($position >= '48027176') and ($position <= '48066476'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '28279662') and ($position <= '28283591'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '44970860') and ($position <= '44976203'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '46317932') and ($position <= '46320744'))  {  #comeca o grupo caso          
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '48066475') and ($position <= '48097372')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '22' {
                if(($position >= '51149285') and ($position <= '51197838'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '35920054') and ($position <= '35926406'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '51093399') and ($position <= '51095555')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '18559107') and ($position <= '18560435'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '25628109') and ($position <= '25630670'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '20950255') and ($position <= '20958422'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '39960691') and ($position <= '40018182'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '24151334') and ($position <= '24152013'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '25628109') and ($position <= '25630670')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '28171336') and ($position <= '28172831')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '32585586') and ($position <= '32592488')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '18624351') and ($position <= '18625533'))  {  #comeca o grupo caso          
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '35920054') and ($position <= '35931625')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '19781957') and ($position <= '19783504'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '19098834') and ($position <= '19100995'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }else {say $fh_log $reg, $strForaCNV; }
              case 'X' {say $fh_log $reg, $strForaCNV;} #case X code_mother     
          }
    
}   #While
  
  
  if (not $csv->eof) {
    $csv->error_diag();
  }

close $data;
close $fh_log;

  
   
  
   
