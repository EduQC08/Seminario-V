<h1 class="text-center"> <?=$titulo1?> - <?=$titulo2?> - <?=$titulo3?></h1>

<table class="table table-border mt-3">
  <colgroup>
    <col style='width: 5%'>
    <col style='width: 25%'>
    <col style='width: 25%'>
    <col style='width: 15%'>
    <col style='width: 10%'>
    <col style='width: 10%'>
    <col style='width: 10%'>

  </colgroup>
  <thead>
    <tr>
      <th>numhabitacion</th>
      <th>Apellidos</th>
      <th>Nombre</th>
      <th>fecha de Entrada</th>
      <th>Fecha de salida</th>
      <th>Costo</th>
      <th>Pago</th>
    </tr>
  </thead>
  <tbody>
  <?php foreach($datos as $registros): ?>
    <tr>
      <td><?=$registros['numhabitacion']?></td>
      <td><?=$registros['apellidos']?></td>
      <td><?=$registros['nombres']?></td>
      <td><?=$registros['horaentrada']?></td>
      <td><?=$registros['horasalida']?></td>
      <td><?=$registros['costo']?></td>
      <td><?=$registros['pago']?></td>


    </tr>
  <?php endforeach; ?>
  </tbody>
</table>