<?php

$outputFile = $argv[1];
$classesListFile = $argv[2];
$rootNamespace = $argv[3];
$outputDocsPath = $argv[4];

shell_exec('mkdir -p "' . $outputDocsPath . '"');

$outputDocsPath = realpath($outputDocsPath);

file_put_contents(
  $outputFile,
  '<?php' . PHP_EOL .
  PHP_EOL .
  'return (object)' . var_export(
    [
      'rootNamespace' => $rootNamespace,
      'destDirectory' => $outputDocsPath,
      'format' => 'github',
      'classes' => file($outputFile),
    ],  
    true
   ) . ';'
);
