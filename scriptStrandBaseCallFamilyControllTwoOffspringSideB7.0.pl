#!/usr/bin/perl
use strict;

use warnings;
 
use Text::CSV_XS;

#module Switch
use Switch;

use Class::Fields;

my $filename = 'D:\tr300872\Documents\Bckp 01-08-2014 disij70-trf1\D\Particular\doutorado\dados\Genotype Call - F07.txt';
#my $filename = 'D:\hugo\doutoradoBiotecHugo\genotype_call_f15_teste.txt';

my $file = $filename or die "Need to get CSV file on the command line\n";

my $csv = Text::CSV_XS->new({
    sep_char => qq|\t|
});
 
 my @fields;
 
 my $probe_set_id = '';
 my $call_code_offspring = '';
 my $tx_confidence_offspring = '';
 my $vl_signal_A_offspring = '';
 my $vl_signal_B_offspring = '';
 my $call_base_offspring = '';
 my $call_code_mother = '';
 my $tx_confidence_mother = '';
 my $vl_signal_A_mother = '';
 my $vl_signal_B_mother = '';
 my $call_base_mother = '';
 my $call_code_father = '';
 my $tx_confidence_father = '';
 my $vl_signal_A_father = '';
 my $vl_signal_B_father = '';
 my $call_base_father = '';
 my $dbSNP = '';
 my $position = '';
 my $chromosome_id = '';
     
open(my $data, '<:encoding(utf8)', $file) or die "Could not open '$file' $!\n";
     
open(my $fh_log, '>>', 'D:\tr300872\Documents\Bckp 01-08-2014 disij70-trf1\D\Particular\doutorado\dados\output.strand.base.call.F07B.txt');
#open(my $fh_log, '>>', 'D:\hugo\doutoradoBiotecHugo\output.strand.base.call.teste.txt');
 
while (my $fields = $csv->getline( $data )) {
  
  chomp $fields ;
  $fields =~ s/\s*#.*$//;
  # Para a familia F04.txt temos as seguintes posicoes de cabecalho:
  $probe_set_id             = $fields->[0];        
  $call_code_mother         = $fields->[6];
  $tx_confidence_mother     = $fields->[7];
  $vl_signal_A_mother       = $fields->[8];
  $vl_signal_B_mother       = $fields->[9];
  $call_base_mother         = $fields->[10];  
  $call_code_father         = $fields->[11];
  $tx_confidence_father     = $fields->[12];
  $vl_signal_A_father       = $fields->[13];
  $vl_signal_B_father       = $fields->[14];
  $call_base_father         = $fields->[15];
  $call_code_offspring      = $fields->[16];
  $tx_confidence_offspring  = $fields->[17];
  $vl_signal_A_offspring    = $fields->[18];
  $vl_signal_B_offspring    = $fields->[19];
  $call_base_offspring      = $fields->[20];
  $dbSNP                    = $fields->[21];
  $chromosome_id            = $fields->[22];
  $position                 = $fields->[23];  
     
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
                   $dbSNP,$chromosome_id,$position
               );
  
  
  #  @fields = ($probe_set_id,$call_code_mother,$tx_confidence_mother,
  #                 $vl_signal_A_mother,$vl_signal_B_mother,$call_base_mother,
  #                 $call_code_offspring,$tx_confidence_offspring,
  #                 $vl_signal_A_offspring,$vl_signal_B_offspring,$call_base_offspring,
  #                 $call_code_father,$tx_confidence_father,
  #                 $vl_signal_A_father,$vl_signal_B_father,$call_base_father,
  #                 $dbSNP,$position,$chromosome_id
  #             );
  
  
  #@fields = ($call_code_mother,
  #             $call_base_mother,
  #             $call_code_offspring,
  #             $call_base_offspring,
  #             $call_code_father,
  #             $call_base_father
  #          );
   # my $strMutacao1 = ",Mutacao Genotipica - Origem Inconclusiva";
   # my $strMutacao2 = ",Mutacao Genotipica - Origem Materna e Paterna";
   # my $strMutacao3 = ",Mutacao Genotipica - Origem Materna";
   # my $strMutacao4 = ",Mutacao Genotipica - Origem Paterna";
   my $strMutacao5 = ",Mutacao Base Nitrogenada - Origem Materna ou Paterna";
   my $strMutacao6 = ",Mutacao Base Nitrogenada - Origem Materna e Paterna";
   my $strMutacao7 = ",Mutacao Base Nitrogenada - Origem Materna";
   my $strMutacao8 = ",Mutacao Base Nitrogenada - Origem Paterna";
   my $strMutacao9 = ",Transicao - Purina/Purina";
   my $strMutacao10 = ",Transversao - Purina/Piridimina";
   my $strMutacao11 = ",Nao Houve Mutacao na Base";
   my $strMutacao12 = ",Nao Houve Mutacao na Substituicao da Base";
   
   my $reg = '';
   $reg = join(',',@fields);
  
   #if ($call_code_mother ne 'NoCall' or $call_base_mother ne '') {  
       switch ($call_base_mother) {
          case 'AA' {if ($call_base_father eq 'AA') {          
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao5, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao5, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }                       
                     } #if $call_base_father 'AA'
                     
                     elsif ($call_base_father eq 'AC' or $call_base_father eq 'CA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao5, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao5, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }
                     }#elsif ($call_base_father eq 'AC' or 'CA')
                     elsif ($call_base_father eq 'AG' or $call_base_father eq 'GA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }
                     }#elsif ($call_base_father eq 'AG' or 'GA')
                     elsif ($call_base_father eq 'AT' or $call_base_father eq 'TA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                     }#elsif ($call_base_father eq 'AT' or 'TA')
                     elsif ($call_base_father eq 'CC') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         } 
                     }#elsif ($call_base_father eq 'CC')
                     elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         } 
                     }#elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' )  
                     elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         } 
                     }#elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' )
                     elsif ($call_base_father eq 'GG') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                     }#elsif ($call_base_father eq 'GG')   
                     elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         } 
                     }#elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) 
                     elsif ($call_base_father eq 'TT') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                     }#elsif ($call_base_father eq 'TT')     
                 }  # fim do case AA;
                 
                case ['AC','CA'] {if ($call_base_father eq 'AA') {          
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao5, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao5, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao8,  $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }                       
                     } #if $call_base_father 'AA'
                     
                     elsif ($call_base_father eq 'AC' or $call_base_father eq 'CA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao5, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao5, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }
                     }#elsif ($call_base_father eq 'AC' or 'CA')
                     elsif ($call_base_father eq 'AG' or $call_base_father eq 'GA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }
                     }#elsif ($call_base_father eq 'AG' or 'GA')
                     elsif ($call_base_father eq 'AT' or $call_base_father eq 'TA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                     }#elsif ($call_base_father eq 'AT' or 'TA')
                     elsif ($call_base_father eq 'CC') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         } 
                     }#elsif ($call_base_father eq 'CC')
                     elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         } 
                     }#elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' )  
                     elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         } 
                     }#elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' )
                     elsif ($call_base_father eq 'GG') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                     }#elsif ($call_base_father eq 'GG')   
                     elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         } 
                     }#elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) 
                     elsif ($call_base_father eq 'TT') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                     }#elsif ($call_base_father eq 'TT')     
                 }  # fim do case AC, CA;
                 
            case ['AG','GA'] {if ($call_base_father eq 'AA') {          
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao5, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao5, $strMutacao9;
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao8,  $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }                       
                     } #if $call_base_father 'AA'
                     
                     elsif ($call_base_father eq 'AC' or $call_base_father eq 'CA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;  
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao5, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao5, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9;  
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }
                     }#elsif ($call_base_father eq 'AC' or 'CA')
                     elsif ($call_base_father eq 'AG' or $call_base_father eq 'GA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }
                     }#elsif ($call_base_father eq 'AG' or 'GA')
                     
                     elsif ($call_base_father eq 'AT' or $call_base_father eq 'TA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                     }#elsif ($call_base_father eq 'AT' or 'TA')
                     elsif ($call_base_father eq 'CC') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         } 
                     }#elsif ($call_base_father eq 'CC')
                     
                     elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         } 
                     }#elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' )  
                     elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         } 
                     }#elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' )
                     elsif ($call_base_father eq 'GG') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                     }#elsif ($call_base_father eq 'GG')   
                     elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         } 
                     }#elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) 
                     elsif ($call_base_father eq 'TT') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                     }#elsif ($call_base_father eq 'TT')     
                 }  # fim do case AG, GA;
                 
                 case ['AT','TA'] {if ($call_base_father eq 'AA') {          
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao5, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao5, $strMutacao9;
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao5, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao5, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao8,  $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao5, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }                       
                     } #if $call_base_father 'AA'
                     
                     elsif ($call_base_father eq 'AC' or $call_base_father eq 'CA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;  
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao5, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao5, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9;  
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }
                     }#elsif ($call_base_father eq 'AC' or 'CA')
                     elsif ($call_base_father eq 'AG' or $call_base_father eq 'GA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }
                     }#elsif ($call_base_father eq 'AG' or 'GA')
                     
                     elsif ($call_base_father eq 'AT' or $call_base_father eq 'TA' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                     }#elsif ($call_base_father eq 'AT' or 'TA')
                     elsif ($call_base_father eq 'CC') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         } 
                     }#elsif ($call_base_father eq 'CC')
                     
                     elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         } 
                     }#elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' )  
                     elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao6, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         } 
                     }#elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' )
                     elsif ($call_base_father eq 'GG') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                     }#elsif ($call_base_father eq 'GG')   
                     elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         } 
                     }#elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) 
                     elsif ($call_base_father eq 'TT') {
                         if ($call_base_offspring eq 'AA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9;
                         }
                         elsif ($call_base_offspring eq 'AC') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'CA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AG') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GA') {
                             say $fh_log $reg, $strMutacao8, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'AT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'TA') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                         elsif($call_base_offspring eq 'CC') {
                             say $fh_log $reg, $strMutacao6, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'CG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'GC') {
                             say $fh_log $reg, $strMutacao7, $strMutacao10; 
                         }   
                         elsif($call_base_offspring eq 'CT') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }    
                         elsif($call_base_offspring eq 'TC') {
                             say $fh_log $reg, $strMutacao5, $strMutacao10; 
                         }
                         elsif($call_base_offspring eq 'GG') {
                             say $fh_log $reg, $strMutacao7, $strMutacao9; 
                         }
                         elsif($call_base_offspring eq 'TG') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }                      
                         elsif($call_base_offspring eq 'GT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }    
                         elsif($call_base_offspring eq 'TT') {
                             say $fh_log $reg, $strMutacao11, $strMutacao12; 
                         }
                     }#elsif ($call_base_father eq 'TT')     
                 }  # fim do case AT, TA;
                 
                 case 'CC' {if ($call_base_father eq 'AA') {          
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10;;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10, $strMutacao9; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }                       
                             } #if $call_base_father 'AA'
                     
                             elsif ($call_base_father eq 'AC' or $call_base_father eq 'CA' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10, $strMutacao9; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }
                             }#elsif ($call_base_father eq 'AC' or 'CA')
                             elsif ($call_base_father eq 'AG' or $call_base_father eq 'GA' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }
                             }#elsif ($call_base_father eq 'AG' or 'GA')
                             elsif ($call_base_father eq 'AT' or $call_base_father eq 'TA' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                             }#elsif ($call_base_father eq 'AT' or 'TA')
                             elsif ($call_base_father eq 'CC') {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 } 
                             }#elsif ($call_base_father eq 'CC')
                             elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 } 
                             }#elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' )  
                             elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 } 
                             }#elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' )
                             elsif ($call_base_father eq 'GG') {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }
                             }#elsif ($call_base_father eq 'GG')   
                             elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 } 
                             }#elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) 
                             elsif ($call_base_father eq 'TT') {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                             }#elsif ($call_base_father eq 'TT')     
                 }  # fim do case CC;
                 
                 case ['CG','GC'] {if ($call_base_father eq 'AA') {          
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao8,  $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao9; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     }                       
                                 } #if $call_base_father 'AA'
                                 
                                 elsif ($call_base_father eq 'AC' or $call_base_father eq 'CA' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;  
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao5, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;  
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     }
                                 }#elsif ($call_base_father eq 'AC' or 'CA')
                                 elsif ($call_base_father eq 'AG' or $call_base_father eq 'GA' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao12, $strMutacao12; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     }
                                 }#elsif ($call_base_father eq 'AG' or 'GA')
                                 
                                 elsif ($call_base_father eq 'AT' or $call_base_father eq 'TA' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao5, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao5, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                 }#elsif ($call_base_father eq 'AT' or 'TA')
                                 elsif ($call_base_father eq 'CC') {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     } 
                                 }#elsif ($call_base_father eq 'CC')
                                 
                                 elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     } 
                                 }#elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' )  
                                 elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     } 
                                 }#elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' )
                                 elsif ($call_base_father eq 'GG') {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao5, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                 }#elsif ($call_base_father eq 'GG')   
                                 elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg,$strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     } 
                                 }#elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) 
                                 elsif ($call_base_father eq 'TT') {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                 }#elsif ($call_base_father eq 'TT')     
                 }  # fim do case CG, GC;
                 
                 case ['CT','TC'] {if ($call_base_father eq 'AA') {          
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao8,  $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10, $strMutacao9; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     }                       
                                 } #if $call_base_father 'AA'
                                 
                                 elsif ($call_base_father eq 'AC' or $call_base_father eq 'CA' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;  
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao5, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;  
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     }
                                 }#elsif ($call_base_father eq 'AC' or 'CA')
                                 elsif ($call_base_father eq 'AG' or $call_base_father eq 'GA' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao12, $strMutacao12; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     }
                                 }#elsif ($call_base_father eq 'AG' or 'GA')
                                 
                                 elsif ($call_base_father eq 'AT' or $call_base_father eq 'TA' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao5, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao5, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                 }#elsif ($call_base_father eq 'AT' or 'TA')
                                 elsif ($call_base_father eq 'CC') {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     } 
                                 }#elsif ($call_base_father eq 'CC')
                                 
                                 elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     } 
                                 }#elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' )  
                                 elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     } 
                                 }#elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' )
                                 elsif ($call_base_father eq 'GG') {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao5, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                 }#elsif ($call_base_father eq 'GG')   
                                 elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg,$strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     } 
                                 }#elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) 
                                 elsif ($call_base_father eq 'TT') {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                 }#elsif ($call_base_father eq 'TT')     
                 }  # fim do case CT, TC;      
                 
                 case 'GG' {if ($call_base_father eq 'AA') {          
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10;;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }                       
                             } #if $call_base_father 'AA'
                     
                             elsif ($call_base_father eq 'AC' or $call_base_father eq 'CA' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }
                             }#elsif ($call_base_father eq 'AC' or 'CA')
                             elsif ($call_base_father eq 'AG' or $call_base_father eq 'GA' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }
                             }#elsif ($call_base_father eq 'AG' or 'GA')
                             elsif ($call_base_father eq 'AT' or $call_base_father eq 'TA' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                             }#elsif ($call_base_father eq 'AT' or 'TA')
                             elsif ($call_base_father eq 'CC') {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 } 
                             }#elsif ($call_base_father eq 'CC')
                             elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 } 
                             }#elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' )  
                             elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 } 
                             }#elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' )
                             elsif ($call_base_father eq 'GG') {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }
                             }#elsif ($call_base_father eq 'GG')   
                             elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10;
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 } 
                             }#elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) 
                             elsif ($call_base_father eq 'TT') {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                             }#elsif ($call_base_father eq 'TT')     
                 }  # fim do case GG;         
                 
                 case ['GT','TG'] {if ($call_base_father eq 'AA') {          
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10;  
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10;
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao8,  $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     }                       
                                 } #if $call_base_father 'AA'
                                 
                                 elsif ($call_base_father eq 'AC' or $call_base_father eq 'CA' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;  
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;  
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                 }#elsif ($call_base_father eq 'AC' or 'CA')
                                 elsif ($call_base_father eq 'AG' or $call_base_father eq 'GA' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;  
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;  
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                 }#elsif ($call_base_father eq 'AG' or 'GA')
                                 
                                 elsif ($call_base_father eq 'AT' or $call_base_father eq 'TA' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;  
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;  
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                 }#elsif ($call_base_father eq 'AT' or 'TA')
                                 elsif ($call_base_father eq 'CC') {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     } 
                                 }#elsif ($call_base_father eq 'CC')
                                 
                                 elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     } 
                                 }#elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' )  
                                 elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12;
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     } 
                                 }#elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' )
                                 elsif ($call_base_father eq 'GG') {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                     }
                                 }#elsif ($call_base_father eq 'GG')   
                                 elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9;
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     } 
                                 }#elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) 
                                 elsif ($call_base_father eq 'TT') {
                                     if ($call_base_offspring eq 'AA') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao9;
                                     }
                                     elsif ($call_base_offspring eq 'AC') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'AG') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GA') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'AT') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'TA') {
                                         say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'CG') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'GC') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9;
                                     }   
                                     elsif($call_base_offspring eq 'CT') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }    
                                     elsif($call_base_offspring eq 'TC') {
                                         say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                     }
                                     elsif($call_base_offspring eq 'GG') {
                                         say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                     }
                                     elsif($call_base_offspring eq 'TG') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }                      
                                     elsif($call_base_offspring eq 'GT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }    
                                     elsif($call_base_offspring eq 'TT') {
                                         say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                     }
                                 }#elsif ($call_base_father eq 'TT')     
                 }  # fim do case GT, TG;
                 
                 case 'TT' {if ($call_base_father eq 'AA') {          
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10;;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }                       
                             } #if $call_base_father 'AA'
                     
                             elsif ($call_base_father eq 'AC' or $call_base_father eq 'CA' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }
                             }#elsif ($call_base_father eq 'AC' or 'CA')
                             elsif ($call_base_father eq 'AG' or $call_base_father eq 'GA' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }
                             }#elsif ($call_base_father eq 'AG' or 'GA')
                             elsif ($call_base_father eq 'AT' or $call_base_father eq 'TA' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9;
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9;
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                             }#elsif ($call_base_father eq 'AT' or 'TA')
                             elsif ($call_base_father eq 'CC') {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao10;;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao9; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 } 
                             }#elsif ($call_base_father eq 'CC')
                             elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10;
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 } 
                             }#elsif ($call_base_father eq 'CG' or $call_base_father eq 'GC' )  
                             elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10;
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10;
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10;
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 } 
                             }#elsif ($call_base_father eq 'CT' or $call_base_father eq 'TC' )
                             elsif ($call_base_father eq 'GG') {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10;
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                             }#elsif ($call_base_father eq 'GG')   
                             elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10;
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12;
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 } 
                             }#elsif ($call_base_father eq 'GT' or $call_base_father eq 'TG' ) 
                             elsif ($call_base_father eq 'TT') {
                                 if ($call_base_offspring eq 'AA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10;
                                 }
                                 elsif ($call_base_offspring eq 'AC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GA') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'AT') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'TA') {
                                     say $fh_log $reg, $strMutacao8, $strMutacao10;
                                 }
                                 elsif($call_base_offspring eq 'CC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'CG') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GC') {
                                     say $fh_log $reg, $strMutacao7, $strMutacao10; 
                                 }   
                                 elsif($call_base_offspring eq 'CT') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }    
                                 elsif($call_base_offspring eq 'TC') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao10; 
                                 }
                                 elsif($call_base_offspring eq 'GG') {
                                     say $fh_log $reg, $strMutacao6, $strMutacao9; 
                                 }
                                 elsif($call_base_offspring eq 'TG') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao9;
                                 }                      
                                 elsif($call_base_offspring eq 'GT') {
                                     say $fh_log $reg, $strMutacao5, $strMutacao9;
                                 }    
                                 elsif($call_base_offspring eq 'TT') {
                                     say $fh_log $reg, $strMutacao11, $strMutacao12; 
                                 }
                             }#elsif ($call_base_father eq 'TT')     
                 }  # fim do case TT;
                          
        }  # fim do switch         
   }  # fim do while
	
