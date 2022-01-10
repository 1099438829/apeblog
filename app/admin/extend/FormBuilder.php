<?php


namespace app\admin\extend;

use FormBuilder\Exception\FormBuilderException;
use FormBuilder\Form\IviewForm;

/**
 * 表单构建
 * Class FormBuilder
 * @package app\admin\service
 */
class FormBuilder
{
    /**
     * 生成表单
     * @param $rule
     * @param $url
     * @return string
     * @throws FormBuilderException
     */
    public static function make_post_form($rule, $url)
    {
        $form = new IviewForm($url);
        $form->setMethod('POST');
        $form->setRule($rule);
        $form->setDependScript([
            '<script src="/static/admin/js/formbuilder/jquery.min.js"></script>',
            '<script src="/static/admin/js/formbuilder/vue.min.js"></script>',
            '<link href="/static/admin/js/formbuilder/iview.css" rel="stylesheet">',
            '<script src="/static/admin/js/formbuilder/iview.min.js"></script>',
            '<script src="/static/admin/js/formbuilder/form-create.min.js"></script>',
            '<script src="/static/admin/js/formbuilder/province_city.js"></script>',
            '<script src="/static/admin/js/formbuilder/province_city_area.js"></script>'
        ]);
        return $form;
    }
}