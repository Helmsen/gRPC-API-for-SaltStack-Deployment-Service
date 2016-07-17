include:
  {% if grains['os'] == 'Ubuntu' %}
  - fapra/formulas/restore/restore_ubuntu
  {% elif grains['os'] == 'Amazon' %}
  - fapra/formulas/restore/restore_amazon
  {% endif %}

