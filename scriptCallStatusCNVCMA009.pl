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
my $filename = 'D:\tr300872\Documents\Bckp 01-08-2014 disij70-trf1\D\Particular\doutorado\dados\output.base.genotype.cma009.final.txt';
 
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
open(my $fh_log, '>>', 'D:\tr300872\Documents\Bckp 01-08-2014 disij70-trf1\D\Particular\doutorado\dados\cnvfinalcma009.txt');

 
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
 
  #Familia: CMA009
          switch($chromosome_id) {
              case '1' {
                if(($position >= '24754405') and ($position <= '24764180'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '111829652') and ($position <= '111831915')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '201678203') and ($position <= '201690519')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '240393939') and ($position <= '240395143')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '2' {
                if(($position >= '158996505') and ($position <= '159008503'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '169674181') and ($position <= '169680704')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '213385031') and ($position <= '213387563')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '3' {
                if(($position >= '13678049') and ($position <= '13688871'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '107040138') and ($position <= '107049245')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '170746996') and ($position <= '170749282')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }  
              #case '4' {
              #  if(($position >= '165083494') and ($position <= '165112180'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '5' {
                if(($position >= '15718208') and ($position <= '15720451'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '140218725') and ($position <= '140231827')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '177807083') and ($position <= '177818805')){
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
              #case '7' {
              #  if(($position >= '77474536') and ($position <= '77476822'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '8' {
                if(($position >= '39247097') and ($position <= '39386952'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '12644843') and ($position <= '12652513')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '23240060') and ($position <= '23249100')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }
              }  
              case '9' {
                if(($position >= '17936627') and ($position <= '17949453'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '10' {
                if(($position >= '11117695') and ($position <= '11130082'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '54234584') and ($position <= '54244612')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '11' {
                if(($position >= '103167191') and ($position <= '103168414'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '12' {
                if(($position >= '99797795') and ($position <= '99798577'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '13' {
                if(($position >= '59081993') and ($position <= '59098436'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '114140974') and ($position <= '114158950')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }  
              case '14' {
                if(($position >= '96343859') and ($position <= '96348869'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              #case '15' {
              #  if(($position >= '151052341') and ($position <= '151056637'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              #case '16' {
              #  if(($position >= '89836995') and ($position <= '89838805'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '17' {
                if(($position >= '51903103') and ($position <= '51910984'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '18' {
                if(($position >= '46642529') and ($position <= '46643199'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '48135051') and ($position <= '48140905')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '62512067') and ($position <= '62516230')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '74950944') and ($position <= '74967869')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }  
              case '19' {
                if(($position >= '56265808') and ($position <= '56268416'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '20' {
                if(($position >= '23557488') and ($position <= '23561418'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
               }  
              }
              #case '21' {
              #  if(($position >= '28279662') and ($position <= '28283591'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '22' {
                if(($position >= '20950255') and ($position <= '20958422'))  {            
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

  
   
  
   
