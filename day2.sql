SELECT string_agg(chr(value::integer), '') from full_text as a where (a.value >= 65 and a.value < 91) OR (a.value > 96 and a.value < 123) OR a.value = 32 OR a.value = 33 OR a.value = 34 OR a.value = 39 or a.value = 44 OR a.value = 45 or a.value = 46 or a.value = 40 or a.value = 41 or a.value = 58 or a.value = 59 or a.value =63;

