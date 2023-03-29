# Generated by Django 3.2.4 on 2022-07-18 18:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('startScan', '0029_scanhistory_waf_detection'),
    ]

    operations = [
        migrations.AlterField(
            model_name='directoryfile',
            name='url',
            field=models.CharField(blank=True, max_length=5000, null=True),
        ),
        migrations.AlterField(
            model_name='directoryscan',
            name='command_line',
            field=models.CharField(blank=True, max_length=5000, null=True),
        ),
        migrations.AlterField(
            model_name='endpoint',
            name='matched_gf_patterns',
            field=models.CharField(blank=True, max_length=10000, null=True),
        ),
        migrations.AlterField(
            model_name='endpoint',
            name='page_title',
            field=models.CharField(blank=True, max_length=10000, null=True),
        ),
        migrations.AlterField(
            model_name='technology',
            name='name',
            field=models.CharField(blank=True, max_length=500, null=True),
        ),
        migrations.AlterField(
            model_name='vulnerability',
            name='cvss_metrics',
            field=models.CharField(blank=True, max_length=500, null=True),
        ),
        migrations.AlterField(
            model_name='vulnerability',
            name='description',
            field=models.CharField(blank=True, max_length=20000, null=True),
        ),
        migrations.AlterField(
            model_name='vulnerability',
            name='http_url',
            field=models.CharField(max_length=10000, null=True),
        ),
        migrations.AlterField(
            model_name='vulnerability',
            name='name',
            field=models.CharField(max_length=2500),
        ),
        migrations.AlterField(
            model_name='vulnerability',
            name='template_url',
            field=models.CharField(blank=True, max_length=2500, null=True),
        ),
        migrations.AlterField(
            model_name='vulnerability',
            name='type',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='waf',
            name='manufacturer',
            field=models.CharField(blank=True, max_length=500, null=True),
        ),
        migrations.AlterField(
            model_name='waf',
            name='name',
            field=models.CharField(max_length=500),
        ),
    ]
