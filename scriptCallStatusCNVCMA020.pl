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
my $filename = 'D:\tr300872\Documents\Bckp 01-08-2014 disij70-trf1\D\Particular\doutorado\dados\output.base.genotype.cma020.final.txt';
 
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
open(my $fh_log, '>>', 'D:\tr300872\Documents\Bckp 01-08-2014 disij70-trf1\D\Particular\doutorado\dados\cnvfinalcma020.txt');

 
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
 
  #Familia: CMA020
          switch($chromosome_id) {
              case '1' {
                if(($position >= '152761910') and ($position <= '152763072'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '152767453') and ($position <= '152768688')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              #case '2' {
              #  if(($position >= '98154574') and ($position <= '98162176'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '3' {
                if(($position >= '15743337') and ($position <= '15754329'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '97779709') and ($position <= '97786424')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '145246579') and ($position <= '145267800')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '196507491') and ($position <= '196508551')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }  
              case '4' {
                if(($position >= '93579864') and ($position <= '93593652'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '172987813') and ($position <= '172989506')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '186542638') and ($position <= '186566263')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '5' {
                if(($position >= '1286129') and ($position <= '1350237'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '70978068') and ($position <= '70990820')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '116020772') and ($position <= '116041606')){
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
                if(($position >= '24751224') and ($position <= '24756098'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '142475398') and ($position <= '142486482')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '147011387') and ($position <= '147012227')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '8' {
                if(($position >= '65915861') and ($position <= '65927737'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '112281277') and ($position <= '112294551')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }
              }  
              #case '9' {
              #  if(($position >= '7471166') and ($position <= '7484938'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
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
                if(($position >= '5826030') and ($position <= '5829038'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '12' {
                if(($position >= '24065533') and ($position <= '24070994'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '72184395') and ($position <= '72190025')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '13' {
                if(($position >= '67176205') and ($position <= '67178332'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }  
              #case '14' {
              #  if(($position >= '30166534') and ($position <= '30177999'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }elsif (($position >= '74008368') and ($position <= '74024031')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }elsif (($position >= '96343859') and ($position <= '96348869')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '15' {
                if(($position >= '56950886') and ($position <= '56956628'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '76891727') and ($position <= '76895331')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              #case '16' {
              #  if(($position >= '85880') and ($position <= '113637'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }elsif (($position >= '78373323') and ($position <= '78379573')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '17' {
                if(($position >= '16496388') and ($position <= '16505645'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              #case '18' {
              #  if(($position >= '49880817') and ($position <= '49882589'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }elsif (($position >= '69997866') and ($position <= '70006787')){
              #         say $fh_log $reg, $strDentroCNV;                                            
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}  
              case '19' {
                if(($position >= '41345129') and ($position <= '41357039'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '57733212') and ($position <= '57734315')){
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
                if(($position >= '18559107') and ($position <= '18560435'))  {            
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

  
   
  
   
