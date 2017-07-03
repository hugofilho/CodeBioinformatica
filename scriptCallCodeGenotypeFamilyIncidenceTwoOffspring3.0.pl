#!/usr/bin/perl
use strict;

use warnings;
 
use Text::CSV_XS;

#module Switch
use Switch;

use Class::Fields;

#@utor: Hugo Leite
#Versao: 3.0
#Data: 27/06/2017

# my $filename = 'D:\hugo\doutoradoBiotecHugo\genotype_call_f15_teste.txt';
my $filename = 'D:\tr300872\Documents\Bckp 01-08-2014 disij70-trf1\D\Particular\doutorado\dados\output.strand.base.call.F07B.txt';
 
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
     
open(my $data, '<:encoding(utf8)', $file) or die "Could not open '$file' $!\n";
     
# open(my $fh_log, '>>', 'D:\hugo\doutoradoBiotecHugo\output.log.txt');
open(my $fh_log, '>>', 'D:\tr300872\Documents\Bckp 01-08-2014 disij70-trf1\D\Particular\doutorado\dados\output.genotype.code.base.F07B.txt');

 
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
  
  @fields = ($probe_set_id,$call_code_father,$tx_confidence_father,
                   $vl_signal_A_father,$vl_signal_B_father,$call_base_father,                   
                   $call_code_mother,$tx_confidence_mother,
                   $vl_signal_A_mother,$vl_signal_B_mother,$call_base_mother,
                   $call_code_offspring,$tx_confidence_offspring,
                   $vl_signal_A_offspring,$vl_signal_B_offspring,$call_base_offspring,                   
                   $dbSNP,$chromosome_id,$position,$origem_mutacao, $tipo_mutacao
               );
  
  #@fields = ($probe_set_id,$call_code_mother,$tx_confidence_mother,
  #             $vl_signal_A_mother,$vl_signal_B_mother,$call_base_mother,
  #             $call_code_offspring,$tx_confidence_offspring,
  #             $vl_signal_A_offspring,$vl_signal_B_offspring,$call_base_offspring,
  #             $call_code_father,$tx_confidence_father,
  #             $vl_signal_A_father,$vl_signal_B_father,$call_base_father,
  #             $dbSNP,$position,$chromosome_id,$origem_mutacao, $tipo_mutacao
  #          );
  
  #@fields = ($probe_set_id,
  #             $call_code_mother,
  #             $call_base_mother,
  #             $call_code_father,
  #             $call_base_father,
  #             $call_code_offspring,
  #             $call_base_offspring
  #             $tx_confidence_mother,
  #             $tx_confidence_offspring,
  #             $tx_confidence_father
  #          );

  my $reg = '';
  $reg = join(',',@fields);
  
  #Entra as funções
  #&verificaGenotipo();
  #&verificaBaseNitrogenada();
  
  my $strMutacao1 = ",Mutacao Genotipica - Origem Materna ou Paterna";
  my $strMutacao2 = ",Mutacao Genotipica - Origem em Ambos"; 
  my $strMutacao3 = ",Mutacao Genotipica - Origem Materna";
  my $strMutacao4 = ",Mutacao Genotipica - Origem Paterna";
  my $strMutacao5 = ",Sem Mutacao Genotipica";
  
  # print ($call_code_mother);
  # print ($call_code_father);
  # print ($call_code_offspring);
  
  # if ($tx_confidence_mother gt '0.005' or $tx_confidence_offspring gt '0.005' or $tx_confidence_father gt '0.005') {
      # if (($call_code_mother ne 'NoCall') or ($call_base_mother ne '')) {
      # if ($call_base_mother ne '' or $call_base_father ne '' or $call_base_offspring ne '') {
          switch($call_code_mother) {
              case 'AA' {
                if($call_code_father eq 'AA') {            
                     if ($call_code_offspring eq 'AB' or $call_code_offspring eq 'BA' ) {                  
                       say $fh_log $reg, $strMutacao1;
                     }
                     elsif ($call_code_offspring eq 'BB') {                 
                       say $fh_log $reg, $strMutacao2;
                     }
                     else {say $fh_log $reg, $strMutacao5;}            
                } # if($call_code_father)    
                elsif($call_code_father eq 'AB' or $call_code_father eq 'BA' ) {            
                     if ($call_code_offspring eq 'BB') {                  
                       say $fh_log $reg, $strMutacao3;
                     }
                     else {say $fh_log $reg, $strMutacao5;}            
                } #elsif($call_code_father = AB ou BA)
                elsif($call_code_father eq 'BB') {            
                     if ($call_code_offspring eq 'AA') {                  
                       say $fh_log $reg, $strMutacao4;
                     }
                     elsif($call_code_offspring eq 'BB') {                 
                       say $fh_log $reg, $strMutacao3;
                     }
                     else {say $fh_log $reg, $strMutacao5;}            
                } #elsif($call_code_father = BB)          
                else {say $fh_log $reg, $strMutacao5;}
              }#case AA code_mother

              case ['AB','BA'] {
                if($call_code_father eq 'AA') {            
                     if ($call_code_offspring eq 'BB') {                  
                       say $fh_log $reg, $strMutacao4;
                     }               
                     else {say $fh_log $reg, $strMutacao5;}            
                } # if($call_code_father AA)             
                elsif($call_code_father eq 'BB') {            
                     if ($call_code_offspring eq 'AA') {                  
                       say $fh_log $reg, $strMutacao4;
                     }               
                     else {say $fh_log $reg, $strMutacao5;}            
                } #elsif($call_code_father = BB)          
                else {say $fh_log $reg, $strMutacao5;}
              }#case AA code_mother  
              
              case 'BB' {
                if($call_code_father eq 'AA') {            
                     if ($call_code_offspring eq 'BB') {                 
                       say $fh_log $reg, $strMutacao4;
                     }               
                     else {say $fh_log $reg, $strMutacao5;}            
                } # if($call_code_father AA)             
                elsif($call_code_father eq 'BB') {            
                     if ($call_code_offspring eq 'AA') {                  
                       say $fh_log $reg, $strMutacao2;
                     }               
                     else {say $fh_log $reg, $strMutacao5;}            
                } #elsif($call_code_father = BB)          
                else {say $fh_log $reg, $strMutacao5;}
              }#case AA code_mother  
              
          }# switch($call_code_mother) 
    #    }# if $call_base
    # }# if $call_code      
 # }# if $tx_confidence
  
 # if (defined $strMutacao1) {
 	
 # }
 # else {print $fh_log $reg};
  
  
 # sub verificaBaseNitrogenada()
 # {
 #   my $strMutacao5 = ",Mutacao Base Nitrogenada - Origem Inconclusiva";
 #   my $strMutacao6 = ",Mutacao Base Nitrogenada - Origem Materna e Paterna";
 #   my $strMutacao7 = ",Mutacao Base Nitrogenada - Origem Materna";
 #   my $strMutacao8 = ",Mutacao Base Nitrogenada - Origem Paterna";
 #   my $strMutacao9 = ",Transicao - Purina/Purina";
 #   my $strMutacao10 = ",Transversao - Purina/Piridimina";	
 #   switch ($call_base_mother) {
 #     case 'AA' {if ($call_base_father eq 'AA') {          
 #                    if ($call_base_offspring ne 'AA') {   
 #                       say $fh_log $reg, $strMutacao5, $strMutacao10; 
 #                    }
 #               }
 #     }
 #   }
 # }
    
}   #While
  
  
  if (not $csv->eof) {
    $csv->error_diag();
  }

close $data;
close $fh_log;

  
   
  
   
