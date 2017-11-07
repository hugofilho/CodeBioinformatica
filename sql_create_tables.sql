cytoscancontroll 	CREATE TABLE `cytoscancontroll` (
 `probesetid` varchar(10) DEFAULT NULL,
 `callcodefather` varchar(6) DEFAULT NULL,
 `confidencefather` double DEFAULT NULL,
 `sinalafather` double DEFAULT NULL,
 `sinalbfather` double DEFAULT NULL,
 `callbasefather` varchar(6) DEFAULT NULL,
 `callcodemae` varchar(6) DEFAULT NULL,
 `confidencemae` double DEFAULT NULL,
 `sinalamae` double DEFAULT NULL,
 `sinalbmae` double DEFAULT NULL,
 `callbasemae` varchar(6) DEFAULT NULL,
 `callcodefilho` varchar(6) DEFAULT NULL,
 `confidencefilho` double DEFAULT NULL,
 `sinalafilho` double DEFAULT NULL,
 `sinalbfilho` double DEFAULT NULL,
 `callbasefilho` varchar(6) DEFAULT NULL,
 `dbsnprs` varchar(20) DEFAULT NULL,
 `position` int(11) DEFAULT NULL,
 `idchromosome` varchar(10) DEFAULT NULL,
 `origem_mutacao_base` varchar(60) DEFAULT NULL,
 `tipo_mutacao_base` varchar(60) DEFAULT NULL,
 `mutacao_genotipica` varchar(46) DEFAULT NULL,
 `familia` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE `cytoscancasos` (
 `probesetid` varchar(10) DEFAULT NULL,
 `callcodefather` varchar(6) DEFAULT NULL,
 `confidencefather` double DEFAULT NULL,
 `sinalafather` double DEFAULT NULL,
 `sinalbfather` double DEFAULT NULL,
 `callbasefather` varchar(6) DEFAULT NULL,
 `callcodemae` varchar(6) DEFAULT NULL,
 `confidencemae` double DEFAULT NULL,
 `sinalamae` double DEFAULT NULL,
 `sinalbmae` double DEFAULT NULL,
 `callbasemae` varchar(6) DEFAULT NULL,
 `callcodefilho` varchar(6) DEFAULT NULL,
 `confidencefilho` double DEFAULT NULL,
 `sinalafilho` double DEFAULT NULL,
 `sinalbfilho` double DEFAULT NULL,
 `callbasefilho` varchar(6) DEFAULT NULL,
 `dbsnprs` varchar(20) DEFAULT NULL,
 `position` int(11) DEFAULT NULL,
 `idchromosome` varchar(60) DEFAULT NULL,
 `origem_mutacao_base` varchar(60) DEFAULT NULL,
 `tipo_mutacao_base` varchar(60) DEFAULT NULL,
 `mutacao_genotipica` varchar(46) DEFAULT NULL,
 `familia` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1
