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
my $filename = 'D:\tr300872\Documents\Bckp 01-08-2014 disij70-trf1\D\Particular\doutorado\dados\output.base.genotype.cma008.final.txt';
 
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
open(my $fh_log, '>>', 'D:\tr300872\Documents\Bckp 01-08-2014 disij70-trf1\D\Particular\doutorado\dados\cnvfinalcma008.txt');

 
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
 
  #Familia: CMA008
          switch($chromosome_id) {
              #case '1' {
              #  if(($position >= '62549504') and ($position <= '62553521'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }elsif (($position >= '111829494') and ($position <= '111830918')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }elsif (($position >= '207816479') and ($position <= '207822856')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }elsif (($position >= '220158790') and ($position <= '220160649')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              #case '2' {
              #  if(($position >= '35932261') and ($position <= '35944654'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }elsif (($position >= '73184771') and ($position <= '73195576')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }elsif (($position >= '83276739') and ($position <= '83284392')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }elsif (($position >= '84787384') and ($position <= '84795916')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '3' {
                if(($position >= '100805204') and ($position <= '100815591'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }  
              case '4' {
                if(($position >= '165083494') and ($position <= '165112180'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              #case '5' {
              #  if(($position >= '135208907') and ($position <= '135214816'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }elsif (($position >= '150205040') and ($position <= '150218591')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }
              #  else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '6' {
                if(($position >= '252596') and ($position <= '253296'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '53931053') and ($position <= '53931790')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '64759581') and ($position <= '64761860')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '77436849') and ($position <= '77455232')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '7' {
                if(($position >= '77474536') and ($position <= '77476822'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '8' {
                if(($position >= '22014759') and ($position <= '22019897'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }
              }  
              #case '9' {
              #  if(($position >= '79550416') and ($position <= '79567014'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }elsif (($position >= '114711368') and ($position <= '114726806')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '10' {
                if(($position >= '81446577') and ($position <= '81464341'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '11' {
                if(($position >= '3766584') and ($position <= '3768305'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '48598353') and ($position <= '48611661')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '121954569') and ($position <= '121958520')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '12' {
                if(($position >= '115145760') and ($position <= '115149241'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '13' {
                if(($position >= '31925077') and ($position <= '31937810'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }  
              case '14' {
                if(($position >= '40608927') and ($position <= '40621990'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '66068513') and ($position <= '66075201')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '96343859') and ($position <= '96348869')){
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
              case '16' {
                if(($position >= '89836995') and ($position <= '89838805'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '17' {
                if(($position >= '34440082') and ($position <= '34477480'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '18' {
                if(($position >= '74950944') and ($position <= '74960117'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }  
              case '19' {
                if(($position >= '52590876') and ($position <= '52593046'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              #case '20' {
              #  if(($position >= '16540464') and ($position <= '16543083'))  {            
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
              #case '22' {
              #  if(($position >= '39960691') and ($position <= '40018182'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
          }
    
}   #While
  
  
  if (not $csv->eof) {
    $csv->error_diag();
  }

close $data;
close $fh_log;

  
   
  
   
