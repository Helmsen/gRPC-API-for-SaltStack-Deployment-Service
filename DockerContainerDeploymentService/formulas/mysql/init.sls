include:
 {% if grains['os'] == 'Ubuntu' %}
  - fapra/formulas/mysql/mysql_ubuntu
 {% elif grains['os'] == 'Amazon' %}
 - fapra/formulas/mysql/mysql_amazon
 {% endif %}
