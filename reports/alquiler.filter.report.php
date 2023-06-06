<?php

require_once '../vendor/autoload.php';
require_once '../model/Alquiler.php';
//require_once '../models/race.php';

use Spipu\Html2Pdf\Html2Pdf;
use Spipu\Html2Pdf\Exception\Html2PdfException;
use Spipu\Html2Pdf\Exception\ExceptionFormatter;

try {

  //Instanciar la clase superherp

  $alquiler = new getAlquilerResume();
  $datos = $alquiler->listar($_GET['idalquiler']);

  $titulo1 = $_GET['titulo1'];


  

  

    ob_start();

    //Archivos que componen PDF
    
    //Archivos con datos(estaticos/dinamicos)
    
    include './alquiler.data.php';
    //Hoja de estilos
    include './estilos.report.html';
    
    $content = ob_get_clean();

    $html2pdf = new Html2Pdf('P', 'A4', 'es');
    $html2pdf->writeHTML($content);
    $html2pdf->output('Alquiler.pdf');
} catch (Html2PdfException $e) {
    $html2pdf->clean();

    $formatter = new ExceptionFormatter($e);
    echo $formatter->getHtmlMessage();
}
