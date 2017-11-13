#!/usr/bin/perl
use strict;

use warnings;
 
use Text::CSV_XS;

#module Switch
use Switch;

use Class::Fields;

#@utor: Hugo Leite
#Versao: 3.3
#Data: 21/07/2017
#Colocando dentro do GitHub

# my $filename = 'D:\hugo\doutoradoBiotecHugo\genotype_call_f15_teste.txt';
my $filename = 'D:\tr300872\Documents\Bckp 01-08-2014 disij70-trf1\D\Particular\doutorado\dados\output.base.genotype.f18.final.txt';
 
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
 my $tipo_mutacao = '';
 my $mutacao_genotipo = '';
 my $familia = '';
     
open(my $data, '<:encoding(utf8)', $file) or die "Could not open '$file' $!\n";
     
# open(my $fh_log, '>>', 'D:\hugo\doutoradoBiotecHugo\output.log.txt');
open(my $fh_log, '>>', 'D:\tr300872\Documents\Bckp 01-08-2014 disij70-trf1\D\Particular\doutorado\dados\cnvfinalf18.txt');

 
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
  $tipo_mutacao             = $fields->[20]; 
  $mutacao_genotipo         = $fields->[21];    
  $familia                  = $fields->[22];
     
  #$probe_set_id             = $fields->[0];
  #$call_code_mother         = $fields->[1];
  #$tx_confidence_mother     = $fields->[2];
  #$vl_signal_A_mother       = $fields->[3];
  #$vl_signal_B_mother       = $fields->[4];
  #$call_base_mother         = $fields->[5];
  #$call_code_offspring      = $fields->[6];
  #$tx_confidence_offspring  = $fields->[7];
  #$vl_signal_A_offspring    = $fields->[8];
  #$vl_signal_B_offspring    = $fields->[9];
  #$call_base_offspring      = $fields->[10]; 
  #$call_code_father         = $fields->[11];
  #$tx_confidence_father     = $fields->[12];
  #$vl_signal_A_father       = $fields->[13];
  #$vl_signal_B_father       = $fields->[14];
  #$call_base_father         = $fields->[15];
  #$dbSNP                    = $fields->[16];
  #$position                 = $fields->[17];
  #$chromosome_id            = $fields->[18];
  
  @fields = ($probe_set_id,
                   $call_code_father,
                   $tx_confidence_father,
                   $call_base_father,                   
                   $call_code_mother,
                   $tx_confidence_mother,
                   $call_base_mother,
                   $call_code_offspring,
                   $tx_confidence_offspring,
                   $call_base_offspring,                   
                   $dbSNP,
                   $chromosome_id,
                   $position,
                   $origem_mutacao,
                   $tipo_mutacao,
                   $mutacao_genotipo,
                   $familia
               );
  
  my $reg = '';
  $reg = join(',',@fields);
  
  my $strDentroCNV = ",Dentro da CNV,";
  my $strForaCNV =   ",Fora da CNV,";
    
  #print ($chromosome_id);
  #print ($position);
  #print ($call_code_offspring);  
 
  #Familia: F18
          switch($chromosome_id) {
              case '1' {
                if(($position >= '35629051') and ($position <= '35635760'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '62107805') and ($position <= '62120073')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '175454789') and ($position <= '175456321')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '215442443') and ($position <= '215464963')){
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
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '3' {
                if(($position >= '136019293') and ($position <= '136031478'))  {            
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
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '5' {
                if(($position >= '150177170') and ($position <= '150202248'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '70978068') and ($position <= '70990820')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }
                else{
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
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '10' {
                if(($position >= '11117695') and ($position <= '11130082'))  {            
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
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              #case '12' {
              #  if(($position >= '48724300') and ($position <= '48725402'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '13' {
                if(($position >= '115044301') and ($position <= '115107733'))  {            
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
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '15' {
                if(($position >= '27629288') and ($position <= '27630898'))  {            
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
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '18' {
                if(($position >= '8380158') and ($position <= '8391031'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '69997866') and ($position <= '70006787')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }  
              #case '19' {
              #  if(($position >= '56864742') and ($position <= '56874482'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              #case '20' {
              #  if(($position >= '40723762') and ($position <= '40732807'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '21' {
                if(($position >= '48027176') and ($position <= '48066476'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '22' {
                if(($position >= '51149285') and ($position <= '51197838'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
          }
    
}   #While
  
  
  if (not $csv->eof) {
    $csv->error_diag();
  }

close $data;
close $fh_log;

  
   
  
   
