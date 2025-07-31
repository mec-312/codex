    v_code varchar2(20);
    v_tipo varchar2(5);
    v_conceptopago varchar2(20);
    v_descripcion varchar2(4000);
    v_ind_estado varchar2(4000);
    v_usua_id varchar2(4000);
    v_ytvcoll_pk varchar2(4000);
    BEGIN

    jsonObj := json(P_DATA);
    v_code := ky_json.campo(jsonObj, 'code');
    v_descripcion := ky_json.campo(jsonObj, 'descripcion');
    v_ind_estado := ky_json.campo(jsonObj, 'ind_estado');
    v_usua_id := ky_json.campo(jsonObj, 'usua_id');
    v_ytvcoll_pk := ky_json.campo(jsonObj, 'ytvcoll_pk');
  -- code := jsonObj.get_string('code');
         VALUES (v_code,
                 v_descripcion,
                 sysdate,
                 v_ind_estado,
                 v_usua_id);
         SET     YTVCOLL_DESCRIPCION      = upper(v_descripcion),
                 YTVCOLL_FECHA_ACTIVIDAD  = sysdate,
                 YTVCOLL_IND_ESTADO       = v_ind_estado,
                 YTVCOLL_USUA_ID          = v_usua_id
         WHERE  YTVCOLL_CODE             = trim(v_ytvcoll_pk);
     DELETE YTVCOLL WHERE YTVCOLL_CODE=trim(v_ytvcoll_pk);
