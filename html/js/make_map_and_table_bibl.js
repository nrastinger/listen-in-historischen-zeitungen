
function build_map_and_table(map_cfg, table_cfg, wms_cfg = null, tms_cfg = null) {
  const tableElement = document.getElementById("biblTable");
  const mapElement = document.getElementById(map_cfg.div_id);

  const map = L.map(mapElement).setView(map_cfg.initial_coordinates, map_cfg.initial_zoom);

  L.tileLayer(map_cfg.base_map_url, {
    attribution: map_cfg.attribution,
    subdomains: map_cfg.subdomains,
    maxZoom: map_cfg.max_zoom,
    minZoom: map_cfg.min_zoom,
  }).addTo(map);

  const markers = L.markerClusterGroup();
  const tableRows = tableElement.querySelectorAll("tbody tr");

  tableRows.forEach(row => {
    const cells = row.querySelectorAll("td");
    const title = cells[0]?.textContent;
    const newspaper = cells[1]?.textContent;
    const earliest = cells[2]?.textContent;
    const latest = cells[3]?.textContent;
    const lat = parseFloat(cells[4]?.textContent);
    const lon = parseFloat(cells[5]?.textContent);

    if (!isNaN(lat) && !isNaN(lon)) {
      const marker = L.marker([lat, lon]);
      marker.bindPopup(
        "<strong>" + title + "</strong><br/>" +
        "Zeitung: " + newspaper + "<br/>" +
        "Frühester Nachweis: " + earliest + "<br/>" +
        "Spätester Nachweis: " + latest
      );
      markers.addLayer(marker);

      // Optional: zoom on click
      row.addEventListener("click", () => {
        map.setView([lat, lon], map_cfg.on_row_click_zoom);
        marker.openPopup();
      });
    }
  });

  map.addLayer(markers);
}
