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
my $filename = 'D:\tr300872\Documents\Bckp 01-08-2014 disij70-trf1\D\Particular\doutorado\dados\output.base.genotype.cma016.final.txt';
 
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
open(my $fh_log, '>>', 'D:\tr300872\Documents\Bckp 01-08-2014 disij70-trf1\D\Particular\doutorado\dados\cnvfinalcma016.txt');

 
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
 
  #Familia: CMA016
          switch($chromosome_id) {
              case '1' {
                if(($position >= '72771520') and ($position <= '72812440'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '2' {
                if(($position >= '98154574') and ($position <= '98162176'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '3' {
                if(($position >= '59833700') and ($position <= '59836600'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }  
              case '4' {
                if(($position >= '70389847') and ($position <= '70401338'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '5' {
                if(($position >= '112513119') and ($position <= '112515194'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '120091003') and ($position <= '120104988')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '168726085') and ($position <= '168736211')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              #case '6' {
              #  if(($position >= '252596') and ($position <= '253296'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }elsif (($position >= '53931053') and ($position <= '53931790')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }elsif (($position >= '64759581') and ($position <= '64761860')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }elsif (($position >= '77436849') and ($position <= '77455232')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '7' {
                if(($position >= '150553743') and ($position <= '150559408'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '154508895') and ($position <= '154511524')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '8' {
                if(($position >= '4776974') and ($position <= '4784519'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '104708431') and ($position <= '104717618')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '112281405') and ($position <= '112294551')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }
              }  
              case '9' {
                if(($position >= '7471166') and ($position <= '7484938'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              #case '10' {
              #  if(($position >= '11117695') and ($position <= '11130082'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }elsif (($position >= '54234584') and ($position <= '54244612')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '11' {
                if(($position >= '81503551') and ($position <= '81516799'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '97862991') and ($position <= '97865064')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '107792538') and ($position <= '107811265')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '12' {
                if(($position >= '33301815') and ($position <= '33304553'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '93769354') and ($position <= '93778522')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '114771834') and ($position <= '114775067')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              #case '13' {
              #  if(($position >= '59081993') and ($position <= '59098436'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }elsif (($position >= '114140974') and ($position <= '114158950')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}  
              case '14' {
                if(($position >= '30166534') and ($position <= '30177999'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '74008368') and ($position <= '74024031')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '96343859') and ($position <= '96348869')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '15' {
                if(($position >= '67017221') and ($position <= '67034047'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '16' {
                if(($position >= '85880') and ($position <= '113637'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '78373323') and ($position <= '78379573')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '17' {
                if(($position >= '44190670') and ($position <= '44201470'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '18' {
                if(($position >= '49880817') and ($position <= '49882589'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '69997866') and ($position <= '70006787')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }  
              case '19' {
                if(($position >= '23583734') and ($position <= '23603182'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '24322835') and ($position <= '24325212')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              #case '20' {
              #  if(($position >= '23557488') and ($position <= '23561418'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              # }  
              #}
              #case '21' {
              #  if(($position >= '28279662') and ($position <= '28283591'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '22' {
                if(($position >= '25628109') and ($position <= '25630670'))  {            
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

  
   
  
   
