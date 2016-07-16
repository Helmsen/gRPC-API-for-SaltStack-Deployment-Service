include:
  {% if grains['os'] == 'Ubuntu' %}
  - fapra/formulas/connect/connect_ubuntu
  {% elif grains['os'] == 'Amazon' %}
  - fapra/formulas/connect/connect_amazon
  {% endif %}

