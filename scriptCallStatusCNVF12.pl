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
my $filename = 'D:\tr300872\Documents\Bckp 01-08-2014 disij70-trf1\D\Particular\doutorado\dados\output.base.genotype.f12.final.txt';
 
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
open(my $fh_log, '>>', 'D:\tr300872\Documents\Bckp 01-08-2014 disij70-trf1\D\Particular\doutorado\dados\cnvfinalf12.txt');

 
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
 
  #Familia: F12
          switch($chromosome_id) {
              case '1' {
                if(($position >= '80210590') and ($position <= '80258823'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '2098292') and ($position <= '2188998')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '1616989') and ($position <= '1652775')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '89427127') and ($position <= '89428877')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '227483824') and ($position <= '227486981')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '2' {
                if(($position >= '100391602') and ($position <= '100392471'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '136032966') and ($position <= '136040551')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '168209305') and ($position <= '168216529')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '180652879') and ($position <= '180658096')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '3' {
                if(($position >= '40257952') and ($position <= '40261973'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '98936626') and ($position <= '98950964')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '131290997') and ($position <= '131299232')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }  
              case '4' {
                if(($position >= '266834') and ($position <= '268863'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '169474971') and ($position <= '169479436')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '5' {
                if(($position >= '150177170') and ($position <= '150218591'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '42680341') and ($position <= '42682673')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '150055721') and ($position <= '150071659')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '155471683') and ($position <= '155482716')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '6' {
                if(($position >= '52624205') and ($position <= '52630666'))  {            
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
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '7' {
                if(($position >= '7883959') and ($position <= '7888519'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '8' {
                if(($position >= '8729760') and ($position <= '8730598'))  {            
                      say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '82693348') and ($position <= '82695743')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }
              }  
              case '9' {
                if(($position >= '34108201') and ($position <= '34114594'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '10' {
                if(($position >= '89498942') and ($position <= '89504978'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '132987305') and ($position <= '132992938')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '11' {
                if(($position >= '131779926') and ($position <= '103168414'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '12' {
                if(($position >= '9967906') and ($position <= '9975878'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '24065966') and ($position <= '24070994')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '101207965') and ($position <= '101214196')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '103228016') and ($position <= '103235233')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '13' {
                if(($position >= '20482870') and ($position <= '20485732'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '41471239') and ($position <= '41484874')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '87474728') and ($position <= '87487206')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }elsif (($position >= '27997998') and ($position <= '27999872')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }  
              case '14' {
                if(($position >= '88687170') and ($position <= '88691336'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '15' {
                if(($position >= '23191760') and ($position <= '23213566'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }elsif (($position >= '42647929') and ($position <= '42651648')){
                       say $fh_log $reg, $strDentroCNV;                                            
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '16' {
                if(($position >= '76500619') and ($position <= '76504659'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              #case '17' {
              #  if(($position >= '39423000') and ($position <= '39432827'))  {            
              #         say $fh_log $reg, $strDentroCNV;                     
              #  }else{
              #         say $fh_log $reg, $strForaCNV;                     
              #  }  
              #}
              case '18' {
                if(($position >= '49880817') and ($position <= '49882589'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }  
              case '19' {
                if(($position >= '54722727') and ($position <= '54741292'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
              case '20' {
                if(($position >= '16662744') and ($position <= '16667869'))  {            
                       say $fh_log $reg, $strDentroCNV;                     
                }else{
                       say $fh_log $reg, $strForaCNV;                     
                }  
              }
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

  
   
  
   
