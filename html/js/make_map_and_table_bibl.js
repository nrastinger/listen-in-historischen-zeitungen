function build_map_and_table(map_cfg, table_cfg, wms_cfg = null, tms_cfg = null) {
  const tableElement = document.getElementById("biblTable");
  const mapElement = document.getElementById(map_cfg.div_id);

  const map = L.map(mapElement).setView(map_cfg.initial_coordinates, map_cfg.initial_zoom);

  const baseLayer = L.tileLayer(map_cfg.base_map_url, {
    attribution: map_cfg.attribution,
    subdomains: map_cfg.subdomains,
    maxZoom: map_cfg.max_zoom,
    minZoom: map_cfg.min_zoom,
  });

  baseLayer.addTo(map);

  const markers = L.markerClusterGroup({
    polygonOptions: {
      color: '#2ff6ef', // change line color of polygon
      fillColor: '#88DBDF' // change fill color of polygon
    }
  });

  const blackIcon = new L.Icon({
    iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-black.png',
    shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',
    iconSize: [25, 41],
    iconAnchor: [12, 41],
    popupAnchor: [1, -34],
    shadowSize: [41, 41]
  });

const tableRows = tableElement.querySelectorAll("tbody tr");

tableRows.forEach(row => {
  const cells = row.querySelectorAll("td");

  // Visible columns
  const listTitle = (cells[0]?.textContent || "").trim();
  const company = (cells[1]?.textContent || "").trim();
  const earliest = (cells[2]?.textContent || "").trim();
  const latest = (cells[3]?.textContent || "").trim();
  const lat = parseFloat((cells[4]?.textContent || "").trim());
  const lon = parseFloat((cells[5]?.textContent || "").trim());

  // Hidden columns (you need to output these in map.xsl)
  const id = (cells[6]?.textContent || "").trim();                 // xml:id
  const companyPlaces = (cells[7]?.textContent || "").trim();      // "Wien (Q...); Budapest (Q...)"

  if (!isNaN(lat) && !isNaN(lon)) {
    const marker = L.marker([lat, lon], { icon: blackIcon });

    const entryHref = id ? `${id}.html` : "#";

    const popupHtml =
      `<a href="${entryHref}"><strong><em>${listTitle}</em></strong></a><br/>` +
      `<strong>Periodikum:</strong> <em>${company}</em><br/>` +
      `<strong>Publikationsorte:</strong> ${companyPlaces}<br/>` +
      `<strong>Frühester Nachweis:</strong> ${earliest}<br/>` +
      `<strong>Spätester Nachweis:</strong> ${latest}`;

    marker.bindPopup(popupHtml);

    markers.addLayer(marker);

    row.addEventListener("click", () => {
      map.setView([lat, lon], map_cfg.on_row_click_zoom);
      marker.openPopup();
    });
  }
});

  map.addLayer(markers);

  // ✅ ADD: Toggleable TMS (XYZ) Layer Support
  if (tms_cfg && tms_cfg.layer) {
    const overlays = {
      [tms_cfg.label || "Overlay"]: tms_cfg.layer
    };
    const baseMaps = {
      "Base Map": baseLayer
    };
    L.control.layers(baseMaps, overlays).addTo(map);
  }
}