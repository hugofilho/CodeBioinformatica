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

my $filename = 'D:\hugo\doutoradoBiotecHugo\genotype_call_F09-3F.txt';

 
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
open(my $fh_log, '>>', 'D:\tr300872\Documents\Bckp 01-08-2014 disij70-trf1\D\Particular\doutorado\dados\cnvfinalf08.txt');

 
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
 
  #Familia: F08
          switch($chromosome_id) { 
              case '1' {
                if(($position >= '111829494') and ($position <= '111830918'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '150388317') and ($position <= '150389392')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '200139281') and ($position <= '200142317')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '2' {  
                if(($position >= '76736293') and ($position <= '76754936'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '3' { 
                if(($position >= '69958119') and ($position <= '69961028'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }       
                else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }  
              #case '4' {
              #  if(($position >= '95948704') and ($position <= '95953319'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '5' { 
                if(($position >= '150174891') and ($position <= '150202248'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              } 
              case '6' {  
                if(($position >= '29580873') and ($position <= '29585573'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '29837157') and ($position <= '29921739')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              #case '7' {
              #  if(($position >= '39399651') and ($position <= '39404742'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '8' { 
                if(($position >= '39247097') and ($position <= '39384337'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '113262902') and ($position <= '113266695')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }
              }  
              #case '9' { 
              #  if(($position >= '71740193') and ($position <= '71742977'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '10' {
                if(($position >= '9993321') and ($position <= '9999708'))  {            
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
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              #case '11' {
              #  if(($position >= '103167191') and ($position <= '103168414'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '12' { 
                if(($position >= '72992904') and ($position <= '73000019'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              #case '13' {
              #  if(($position >= '20482870') and ($position <= '20485732'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }elsif (($position >= '60615604') and ($position <= '60632677')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }elsif (($position >= '89991826') and ($position <= '90000514')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}  
              case '14' { 
                if(($position >= '23921561') and ($position <= '23922240'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              #case '15' {
              #  if(($position >= '23286571') and ($position <= '23290819'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }elsif (($position >= '62166587') and ($position <= '62170347')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '16' { 
                if(($position >= '7339577') and ($position <= '7340639'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '17' { 
                if(($position >= '2399487') and ($position <= '2402229'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '55594990') and ($position <= '55601038')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              #case '18' {
              #  if(($position >= '48135051') and ($position <= '48140905'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}  
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
              #case '21' {
              #  if(($position >= '46317932') and ($position <= '46320744'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }elsif (($position >= '48066475') and ($position <= '48097372')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              #case '22' {
              #  if(($position >= '19781957') and ($position <= '19783504'))  {            
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
