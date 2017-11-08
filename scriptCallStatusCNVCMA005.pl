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
my $filename = 'D:\tr300872\Documents\Bckp 01-08-2014 disij70-trf1\D\Particular\doutorado\dados\output.base.genotype.cma005.final.txt';
 
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
open(my $fh_log, '>>', 'D:\tr300872\Documents\Bckp 01-08-2014 disij70-trf1\D\Particular\doutorado\dados\cnvfinalcma005.txt');

 
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
 
  #Familia: CMA005
          switch($chromosome_id) {
              case '1' {
                if(($position >= '62549504') and ($position <= '62553521'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '111829494') and ($position <= '111830918')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '207816479') and ($position <= '207822856')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '220158790') and ($position <= '220160649')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '2' {
                if(($position >= '35932261') and ($position <= '35944654'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '73184771') and ($position <= '73195576')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '83276739') and ($position <= '83284392')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '84787384') and ($position <= '84795916')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '3' {
                if(($position >= '69173374') and ($position <= '69183835'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '117958785') and ($position <= '117971959')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }       
                else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }  
              #case '4' {
              #  if(($position >= '68889374') and ($position <= '68890347'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }elsif (($position >= '73419420') and ($position <= '73428729')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }
              #  else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
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
                if(($position >= '32688023') and ($position <= '32689362'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '74590396') and ($position <= '74601724')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '7' {
                if(($position >= '36200453') and ($position <= '36209680'))  {            
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
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '8' {
                if(($position >= '32131653') and ($position <= '32134482'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }
              }  
              case '9' {
                if(($position >= '79550416') and ($position <= '79567014'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '114711368') and ($position <= '114726806')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '10' {
                if(($position >= '34659910') and ($position <= '34670662'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '11' {
                if(($position >= '22343302') and ($position <= '22355160'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '81503551') and ($position <= '81517158')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '12' {
                if(($position >= '26009174') and ($position <= '26013872'))  {            
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
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              #case '13' {
              #  if(($position >= '20485142') and ($position <= '20485807'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }elsif (($position >= '25028928') and ($position <= '25029858')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }elsif (($position >= '44477385') and ($position <= '44485879')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }elsif (($position >= '67176797') and ($position <= '67178094')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }elsif (($position >= '87474728') and ($position <= '87487206')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }elsif (($position >= '89991826') and ($position <= '90000312')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}  
              #case '14' {
              #  if(($position >= '25867958') and ($position <= '25882388'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              #case '15' {
              #  if(($position >= '151052341') and ($position <= '151056637'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '16' {
                if(($position >= '83412636') and ($position <= '83414483'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              #case '17' {
              #  if(($position >= '9870231') and ($position <= '9877173'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '18' {
                if(($position >= '48135051') and ($position <= '48140905'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '51899481') and ($position <= '51903129')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }  
              case '19' {
                if(($position >= '29692896') and ($position <= '29702250'))  {            
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
              case '22' {
                if(($position >= '39960691') and ($position <= '40018182'))  {            
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

  
   
  
   
